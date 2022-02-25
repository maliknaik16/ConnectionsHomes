Help Youth Find a Home!

Connections Homes is a nonprofit organization dedicated to connecting young adults to families. Every year in our country an estimated 85,000 young men and women between the ages of 18 – 24 are living life unconnected to family or any caring stable adult. These young people are living on our streets, in our shelters and in dangerous situations like sex trafficking because they have nowhere to turn. Connections Homes helps these young adults by finding a family who will help them with their life. 

Currently Connections Homes uses a manual process to match a youth with a mentoring family which is time consuming and prone to errors. We would like to contribute to this great movement by creating a Matching API. 



# Connections Homes

[Connections Homes](https://connectionshomes.org/) serves youth 18 – 24 who’ve aged out of foster care or are homeless without family by matching them with a trained and certified Mentoring Family who agrees to be a part of their life, for life, in order to prevent poverty and homelessness and to provide a sense of love and belonging. 

## Matching Algorithm
Connections Homes uses a low-barrier model in matching youth who enters the program and desire to have a Mentoring Family. A youth entering the program must only demonstrate a lack of family support system or history in foster care. 

The only criteria that would prevent a youth from being served by our program are: an active drug addiction, an inability to live independently (severe special needs), or lack of desire for a connection (meaning that someone else referred the youth without their permission or desire.)

## Challenge Description 
Currently Connections Homes uses a manual process to match youth with mentor families. To reduce human error, and increase speed Connections Homes is looking for matching program by using a weight system. 

### Requirements
- Solution should compare one youth at a time against all mentors
- Solution should have an interface to capture youth information. This could be done by creating Roxie query.
- Matches happens based on 0-5 weight scale, with 0 is no desire and 5 is most interested
- If a mentor have  0 weight  on a field that mentor is eliminated. For example: if mentor has a 0 on "Gender_Male", then this mentor is no longer an eligible candidate
- Youth and mentors should be within "Distance" miles provided by user
- If youth has None Available (N/A) values on all fields under a category, then result should be marked as "Human Review"
- Spouse values should be treated the same as primary mentor 
- For fields that contain no values such as "DayOff", if youth and mentor have exact match, it gets one score 
- The matching result should contain all eligible mentors, sorted by Matching Score, the higher the score the better match they are 
- For having more test options please ignore "Status" on mentors dataset
- Keep in mind that some fields in youth and mentors are for information only. 
- Fields with non-numeric values such as "SadnessResponse_spouse" no entry doesn't need to be marked as human review.

### Notes
- Since lats and longs are based on cities, you might get some distance = 0, which means mentor and youth are both in the same town
- To make sure you get least information, try to use ERROR to throw a massage if Distance, Lat and Long aren't provided. 


</br>

<u><b><p style="font-size: 15px">Please refer to [FAQ](./FAQ.md) for more information.</u></b>

</br>

__Example__

Let's say the youth and a mentor are within 20 miles of each other. 

<i>Youth Sample Info</i>

CriminalHistory| SupportNeeds |  Children |
---|---|--
CurrentProbation| Parenting | N/A


</br>
</br>


<i>Mentor Sample Info</i>

CriminalHistory_CurrentProbation| Supports_Parenting |  Children_Welfare1
---|---|--
CurrentProbation| 4 | 2 


Sample Calculation: 

CriminalHistory = 1

SupportNeeds = 4

Children = 0

Total_Score = 5

HumanFlag = Children