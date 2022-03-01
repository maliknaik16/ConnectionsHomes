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
- Spouse values should be treated the same as the primary mentor 
- For fields that contain none-numeric values such as "DayOff", if youth and mentor have exact match, it gets one score 
- The matching result should contain all eligible mentors, sorted by Matching Score, the higher the score the better match they are 
- For having more test options please ignore "Status" on mentors dataset
- Keep in mind that some fields in youth and mentors are for information only. 

### Notes
- Since lats and longs are based on cities, you might get some distance = 0, which means mentor and youth are both in the same city
- To make sure you get the least information, try to use ERROR to throw a massage if <i> Distance, Lat and Long </i>aren't provided
- Make sure your query name is unique so your won't overwrite other queries. Try using a unique name like adding your initial. 
- In ECL Watchpage check the Workunit ID (WUID) number to make sure this is your code in case of having the same query name with another teams.  

</br>

<u><b><p style="font-size: 15px">Please refer to [FAQ](./FAQ.md) for more information.</u></b>

</br>

__Example__

Let's say the and these mentors are within 20 miles of each other. 

</br>
</br>

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

</br>
</br>


Sample Calculation: 

</br>

Mentor| CriminalHistory| SupportNeeds |  Children | Total_Score |HumanReview 
---|---|---|---|---|---
M1 |1| 4| 0 | 5| Children

</b>
</br>

## Platform Choice 

### Cloud IDE
Start with creating a login in [CloudIDE](https://ide.hpccsystems.com/).
User guide is available under Help in CloudIDE, also can be found in this repository.

[ConnectionsHomes_Workshop](https://ide.hpccsystems.com/workspaces/share/287fe2a4-1f9c-4bf4-aa98-fd8e9836a0a8) has the initial record layout and dataset code you need for this challenge. You can also find this code under AdamWorkshop folder in this repository.

### VS Code
1- [HPCC Platform](https://hpccsystems.com/download#HPCC-Platform) installation guide

2- [VS Code](https://code.visualstudio.com)

3- VS Code [Installation UserGuide](https://github.com/hpccsystems-solutions-lab/ConnectionsHomes/blob/main/vscode_hpcc_install.pdf). Only the first three steps are required

4- Clone the repo in your local machine: 
     git clone https://github.com/hpccsystems-solutions-lab/ScheduledFlights-Workshop.git

5- Open VS Code
   - File -> Open Folder
   - Select ch_Workshop subdirectory within the cloned repo and select/open it

</br>

If you need more information on jobs you are running on either platform, please use [ECL Watch Page](http://40.76.26.67:8010)

</br>

## Quick ECL Learning

For a quick start on ECL syntax and hands-on example, please use [Learn ECL](https://hpccsystems-solutions-lab.github.io/).


### Presentation Requirements
- Solution 
- How you approached the solution
- Code snippets 
- Results
- Drawing conclusion


### Judging Criteria 
- All work should be done in ECL
- Presentation materials and skills 
- How the problem was approached and solved 

### Mentors

**Mentors are available from Monday 03/21 - 03/25 from 9AM - 9PM to answer questions.**

![Arjuna Chala](./images/ArjunaChala.jpg)
<p>Arjuna Chala, Sir Dir of Operations. Arjuna’s expertise spans software application development for desktop, web, phone and data analytics.</p>

</br>

![Dan Camper](./images/DanCamp.jpg)

<p>Dan Camper, Sir Architect. He's been writing software professionally for more than 35 years and has worked on a myriad of systems, using many different programming languages.</p>

</br>

![Bahar Fardanian](./images/Bahar.png)
<p>Bahar Fardanian, Technology Evangelist. She is ECL developer and a mentor. Prof at KSU teaching Big Data course.

</br>

### Contact Us
For any question please contact Bahar: bahareh.fardanian@lexisnexisrisk.com</p>
