# Frequently Asked Questions

<i><p style='color:green'><p style='color:green'>  Where do I fine more information about LexisNexis Risk Solution? </i></p>
LexisNexis information can be found [here](https://risk.lexisnexis.com/).

</br>

<i><p style='color:green'><p style='color:green'>  Where do I fine more information on HPCC Systems?</i></p>
Please refer to [HPCC Systems](https://hpccsystems.com/) website.

</br>

<i><p style='color:green'><p style='color:green'>  Where do I fine more information about internship?</i></p>
Please visit our [internship program](https://hpccsystems.com/blog/intern_program).

</br>

<i><p style='color:green'><p style='color:green'>  Where do I find more information on Connections Homes?</i></p>
Please refer to [Connections Homes](https://connectionshomes.org/).

</br>

<i><p style='color:green'><p style='color:green'>  Information on building a Roxie Query?</i></p>
[Working With Roxie](https://hpccsystems.com/training/documentation/programmers-guide/html/ProgGuide_WorkingWithRoxie.html%23Roxie_Overview) introduces you to what roxie query is. 

[STORED](https://hpccsystems.com/training/documentation/ecl-language-reference/html/STORED_workflow_service.html) shows you all the attribute you might need for your input fields. 

</br>

<i><p style='color:green'>  Can I see a Roxie example ?</i></p>
Please see Roxie example and related information in [roxieSample](./roxieSample.md)

</br>

<i><p style='color:green'>  Where do I find Mentors and Youth layout?</i></p>
Mentors layout and dataset along with youth layout can be found in [inputRecords](.\ch_Workshop\inputRecords.ecl).


</br>

<i><p style='color:green'>  What does Definition must contain EXPORT or SHARED value error mean?</i></p>
It means your BWR doesn't have an OUTPUT or if it is a MODULE it doesn't have an EXPORT attribute. 

</br>

<i><p style='color:green'> Are modules executable?</i>  \
No. Modules can have exported values to be called and used outside the modules. 


<i><p style='color:green'>  What does result is too big to output error mean?</i></p>
Means that the dataset you are trying to output is bigger than dedicated memory. You can wrap your OUTPUT with CHOOSEN( ) to solve this error.\
`OUTPUT(CHOOSEN(SampleDS, 150), NAMED('SampleDS));`\
For more information please refer to [CHOOSEN](https://hpccsystems-solutions-lab.github.io/hpcc/Tutorial/ECLSyntax/choosen). 

<i><p style='color:green'> Unknown identifier error when creating a record layout?</i>\
Field names in RECORD should not have spaces or subtraction sign `-`, or start with a numeric value. 

Following names are unacceptable.

![](./images/UknownIdentifire.png)



