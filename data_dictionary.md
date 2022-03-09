#Data Dictionary
###Cars_Info<br/>
|Column Name|Data Type|Required?|Primary Key?|Description|
|---|---|---|---|---|
|Car_ID|INT|No|Yes|Unique ID number identifying each cars|
|Year|INT|No|No|Year of each car make|
|Make|TEXT|No|No|Make of each car|
|Model|TEXT|No|No|Model of each car|
|Name|TEXT|No|No|Name of each car owner|
|Email|TEXT|No|No|Email address of each car owner|

### Judges
|Column Name|Data Type|Required?|Primary Key?|Description|
|-----------|---------|---------|------------|-----------|
|Timestamp|DATETIME|No|No|Time that a car was judged|
|Judge_ID|TEXT|No|No|Unique ID identifying each judge|
|Judge_Name|TEXT|No|No|Name of each judge|

### Cars_Score
|Column Name|Data Type|Required?|Primary Key?|Description|
|-----------|---------|---------|------------|-----------|
|Car_ID|INT|No|No|Unique ID number identifying each car|
|Total|INT|No|No|Total score of each car|



