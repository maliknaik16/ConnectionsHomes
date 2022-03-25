
IMPORT STD;

MentorsRaw_Rec := RECORD
    STRING       FullName;
    STRING       FirstName;
    STRING       LastName;
    STRING       Gender;
    STRING       Status;
    STRING       Region;
    STRING       Ethnicity;
    STRING       Occupation_primary;
    STRING       MaritalStatus;
    STRING       Spouse_FirstName;
    STRING       Spouse_LastName;
    STRING       Spouse_Gender;
    STRING       Spouse_RaceEthnicity;
    STRING       Spouse_Birthday;
    STRING       Spouse_Age;
    STRING       Spouse_Occupation;
    STRING       Street;
    STRING       City;
    STRING       State;
    STRING       ZipCode;
    INTEGER1     Religion_Christian;
    INTEGER1     Religion_Muslim;
    INTEGER1     Religion_Jewish;
    INTEGER1     Religion_Hindu;
    INTEGER1     Religion_Buddhist;
    INTEGER1     Religion_Other;
    INTEGER1     Religion_Spiritual;
    INTEGER1     Religion_None;
    STRING       RoleofFaith_primary;
    STRING       RoleofFaith_spouse;
    INTEGER1     Alcohol_Occasional;
    INTEGER1     Alcohol_Responsible;
    INTEGER1     Alcohol_Irresponsible;
    INTEGER1     DrugUse;
    INTEGER1     Marijuana_Occasional;
    INTEGER1     Marijuana_Regular;
    INTEGER1     Cigarettes_Occasional;
    INTEGER1     Cigarettes_Regular;
    INTEGER1     Vaping_Occasional;
    INTEGER1     Vaping_Regular;
    INTEGER1     JobRetentionChallenges;
    STRING       DayOff_primary;
    STRING       DayOff_spouse;
    STRING       FavoritPlace_primary;
    STRING       FavoritePlace_spouse;
    STRING       Personality_primary;
    STRING       Personality_spouse;
    INTEGER1     SocialStyle_Introverted;
    INTEGER1     SocialStyle_Extraverted;
    INTEGER1     SocialStyle_Both;
    STRING       SadnessResponse_primary;
    STRING       SadnessResponse_spouse;
    STRING       AngerResponse_primary;
    STRING       AngerResponse_spouse;
    INTEGER1     ContinuingEducation;
    INTEGER1     Supports_Holidays;
    INTEGER1     Supports_Job;
    INTEGER1     Supports_Parenting;
    INTEGER1     Supports_Medical;
    INTEGER1     Supports_Legal;
    INTEGER1     Supports_Budgeting;
    INTEGER1     Supports_MentalHealth;
    INTEGER1     Supports_Resources;
    INTEGER1     Supports_Social;
    STRING       Multiple_Matches;
    STRING       Match_Housing;
    STRING       Emergency_Housing;
    INTEGER1     CriminalHistory_Arrested;
    INTEGER1     CriminalHistory_Jail;
    INTEGER1     CriminalHistory_CurrentProbation;
    INTEGER1     Children_Pregnant;
    INTEGER1     Children_Custody1;
    INTEGER1     Children_Custodymultiple;
    INTEGER1     Children_Kincare1;
    INTEGER1     Children_Kincaremultiple;
    INTEGER1     Children_Welfare1;
    INTEGER1     Children_Welfaremultiple;
    INTEGER1     Bio_Important;
    INTEGER1     Bio_Difficult;
    INTEGER1     Sexuality_Heterosexual;
    INTEGER1     Sexuality_Homosexual;
    INTEGER1     Sexuality_Bisexual;
    INTEGER1     Gender_Male;
    INTEGER1     Gender_Female;
    INTEGER1     Gender_Transgender;
    INTEGER1     Gender_Non_binary;
    REAL4        Latitude;
    REAL4        Logatitude;
    STRING       Mentor_Status := 'Active';
    REAL4        Distance := 100000.0;
    INTEGER      Weight := 0;
END;

MentorsRaw_DS   := DATASET('~../data/MentoringFamilies.csv', MentorsRaw_Rec, CSV(HEADING(1)));


YouthRaw_Rec := RECORD
    STRING    FullName;
    STRING    FirstName;
    STRING    LastName;
    STRING    Street;
    STRING    City;
    STRING    State;
    STRING    ZipCode;
    STRING    Region;
    STRING    Birthday;
    INTEGER1  Age;
    STRING    Race_Ethnicity;
    STRING    Religion;
    STRING    RoleofFaith;
    STRING    AlcoholUse;
    STRING    DrugUse;
    STRING    Smoking;
    STRING    JobRetentionChallenges;
    STRING    DayOff;
    STRING    FavoritePlace;
    STRING    Personality;
    STRING    SocialStyle;
    STRING    SadnessResponse;
    STRING    AngerResponse;
    STRING    EducationLevel;
    STRING    ContinuingEducation; 
    STRING    SupportNeeds;
    STRING    LivingSituation;
    STRING    CriminalHistory;
    STRING    Children;
    STRING    Connections;
    STRING    BioRelationships;
    STRING    Sexuality;
    STRING    Gender;
    STRING    BiologicalGender;
    REAL4     Latitude;
    REAl4     Logatitude;
END;

YouthRaw_DS   := DATASET([
    {
        'Amber Lenz',
        'Amber',
        'Lenz',
        '2625 Old Winder Hwy',
        'Braselton',
        'Georgia',
        '30517',
        '13',
        '12/16/1992',
        29,
        'Black/African American',
        'Spiritual',
        'Unimportant',
        'Occasionally',
        'Regularly',
        'None',
        'checked',
        'Movie/Play',
        'Pampered',
        'Adventurous',
        'Both',
        'Self_Reliant',
        'Process',
        'GED completed,College degree',
        '',
        'Mental Health,Holidays,Job,Parenting',
        'Friend/Family',
        'Current Probation',
        'Caring for multiple, 1 in kincare',
        '',
        'Difficult',
        'Bisexual',
        'Female',
        'Female',
        34.10699844360352,
        -83.76239776611328
    }
], YouthRaw_Rec);

REAL4 DISTANCE (REAL4 Lat1, REAL4 Long1, REAL4 Lat2, REAL4 Long2) := FUNCTION
    // Using Haversine Distance Formula to compute the distance.

    REAL4 PI := 22 / 7;
    REAL4 RADIANS := PI / 180;

    _Lat1 := Lat1 * RADIANS;
    _Long1 := Long1 * RADIANS;
    _Lat2 := Lat2 * RADIANS;
    _Long2 := Long2 * RADIANS;

    _Long_Diff := _Long2 - _Long1;
    _Lat_Diff := _Lat2 - _Lat1;

    _A := POWER(SIN(_Lat_Diff / 2), 2) + COS(_Lat1) * COS(_Lat2) * POWER(SIN(_Long_Diff / 2), 2);

    DIST := 2 * 3956 * ASIN(SQRT(_A));

    RETURN DIST;

END;

STRING CLEAN_STRING (STRING INPUT) := FUNCTION
    RETURN STD.Str.ToLowerCase(TRIM(INPUT));
END;

BOOLEAN SUBSTR (STRING Haystack, STRING Needle) := FUNCTION
    RETURN IF(STD.Str.Find(CLEAN_STRING(Haystack), CLEAN_STRING(Needle), 1) = 0, FALSE, TRUE);
END;

MentorsRaw_Rec myTransformer(YouthRaw_Rec L, MentorsRaw_Rec R) := TRANSFORM

    // Gender score.
    Gender_Score := MAP(
        CLEAN_STRING(L.Gender) = 'male' => R.Gender_Male, 
        CLEAN_STRING(L.Gender) = 'female' => R.Gender_Female,
        CLEAN_STRING(L.Gender) = 'other' => R.Gender_Transgender,
        R.Gender_Non_binary
    );

    // Sexuality score.
    Sexuality_Score := MAP(
        CLEAN_STRING(L.Sexuality) = 'homosexual' => R.Sexuality_Homosexual, 
        CLEAN_STRING(L.Sexuality) = 'bisexual' => R.Sexuality_Bisexual,
        CLEAN_STRING(L.Sexuality) = 'heterosexual' => R.Sexuality_Heterosexual,
        -1
    );

    // Children score.
    Children_Score := IF(SUBSTR(L.Children, 'pregnant'), R.Children_Pregnant, 0) +
                      IF(SUBSTR(L.Children, '1 in kincare'), R.Children_Kincare1, 0) +
                      IF(SUBSTR(L.Children, 'multiple in kincare'), R.Children_Kincaremultiple, 0) +
                      IF(SUBSTR(L.Children, 'multiple in welfare'), R.Children_Welfaremultiple, 0) +
                      IF(SUBSTR(L.Children, '1 in welfare'), R.Children_Welfare1, 0) +
                      IF(SUBSTR(L.Children, 'caring for 1'), R.Children_Custody1, 0) +
                      IF(SUBSTR(L.Children, 'caring for multiple'), R.Children_Custodymultiple, 0);

    // Criminal score.
    Criminal_Score := IF(SUBSTR(L.CriminalHistory, 'probation'), R.CriminalHistory_CurrentProbation, 0) +
                      IF(SUBSTR(L.CriminalHistory, 'arrested'), R.CriminalHistory_Arrested, 0) +
                      IF(SUBSTR(L.CriminalHistory, 'jail'), R.CriminalHistory_Jail, 0);
                      
    // Support score.
    Support_Score := IF(SUBSTR(L.SupportNeeds, 'holiday'), R.Supports_Holidays, 0) +
                      IF(SUBSTR(L.SupportNeeds, 'job'), R.Supports_Job, 0) +
                      IF(SUBSTR(L.SupportNeeds, 'parenting'), R.Supports_Parenting, 0) +
                      IF(SUBSTR(L.SupportNeeds, 'medical'), R.Supports_Medical, 0) +
                      IF(SUBSTR(L.SupportNeeds, 'legal'), R.Supports_Legal, 0) +
                      IF(SUBSTR(L.SupportNeeds, 'budget'), R.Supports_Budgeting, 0) +
                      IF(SUBSTR(L.SupportNeeds, 'mental'), R.Supports_MentalHealth, 0) +
                      IF(SUBSTR(L.SupportNeeds, 'resource'), R.Supports_Resources, 0) +
                      IF(SUBSTR(L.SupportNeeds, 'social'), R.Supports_Social, 0);

    // Education Score.
    Education_Score := IF(SUBSTR(L.ContinuingEducation, 'checked'), R.ContinuingEducation, 0);

    // Religion Score.
    Religion_Score := MAP(
        CLEAN_STRING(L.Religion) = 'Spiritual' => R.Religion_Spiritual, 
        CLEAN_STRING(L.Religion) = 'Islam' => R.Religion_Muslim,
        CLEAN_STRING(L.Religion) = 'Buddhism' => R.Religion_Buddhist,
        CLEAN_STRING(L.Religion) = 'Hinduism' => R.Religion_Hindu,
        CLEAN_STRING(L.Religion) = 'Judaism' => R.Religion_Jewish,
        CLEAN_STRING(L.Religion) = 'Christianity' => R.Religion_Christian,
        CLEAN_STRING(L.Religion) = 'Other' => R.Religion_Other,
        CLEAN_STRING(L.Religion) = 'None' => R.Religion_None,
        -1
    );

    Primary_Ethnicity := MAP(
        SUBSTR(L.Race_Ethnicity, 'american') AND SUBSTR(R.Ethnicity, 'american') => 1,
        SUBSTR(L.Race_Ethnicity, 'race') AND SUBSTR(R.Ethnicity, 'race') => 1,
        SUBSTR(L.Race_Ethnicity, 'asian') AND SUBSTR(R.Ethnicity, 'asian') => 1,
        0
    );

    Secondary_Ethnicity := MAP(
        SUBSTR(L.Race_Ethnicity, 'american') AND SUBSTR(R.Spouse_RaceEthnicity, 'american') => 1,
        SUBSTR(L.Race_Ethnicity, 'race') AND SUBSTR(R.Spouse_RaceEthnicity, 'race') => 1,
        SUBSTR(L.Race_Ethnicity, 'asian') AND SUBSTR(R.Spouse_RaceEthnicity, 'asian') => 1,
        0
    );


    Secondary_Faith := IF(CLEAN_STRING(L.RoleofFaith) = CLEAN_STRING(R.RoleofFaith_spouse), 1, 0);
    Primary_Faith := IF(CLEAN_STRING(L.RoleofFaith) = CLEAN_STRING(R.RoleofFaith_spouse), 1, 0);

    // Support score.
    Alcohol_Use_Score := IF(SUBSTR(L.AlcoholUse, 'irrespons'), R.Supports_Holidays, 0) +
                         IF(SUBSTR(L.AlcoholUse, 'respons'), R.Supports_Job, 0) +
                         IF(SUBSTR(L.AlcoholUse, 'occasional'), R.Alcohol_Occasional, 0);

    Overall_Score := Gender_Score +
                     Sexuality_Score +
                     Children_Score +
                     Criminal_Score +
                     Support_Score +
                     Education_Score +
                     Religion_Score +
                     Primary_Ethnicity +
                     Secondary_Ethnicity +
                     Secondary_Faith +
                     Primary_Faith +
                     Alcohol_Use_Score;



    SELF.Distance := DISTANCE(L.Latitude, L.Logatitude, R.Latitude, R.Logatitude);

    SELF.Weight := Overall_Score;
    SELF.Mentor_Status := IF(SUBSTR(L.AlcoholUse, 'addict'), 'Eliminated', IF(Gender_Score = 0 OR Sexuality_Score = 0, 'Human Review', 'Active'));
    SELF := R;
END;

// Here you specify the maximum distance (in miles) within which to search for the mentor for the youth.
WITHIN_MILES := 25;

// Find all the eligible mentors.
myProjection := JOIN(YouthRaw_DS, MentorsRaw_DS, LEFT.State = RIGHT.State, myTransformer(LEFT, RIGHT), RIGHT OUTER);

// Show the results for the active mentors whose weight > 0 and distance is less than the provided max radius
OUTPUT(SORT(myProjection(Weight > 0 and Distance < WITHIN_MILES AND Mentor_Status = 'Active'), -Weight), NAMED('ActiveMentors'));
