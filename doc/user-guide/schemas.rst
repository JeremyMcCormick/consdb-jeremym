########
Schemas
########

* Types of schemas
    * Summit for observers and Summit systems
        * Smallest, contains primary key information from HeaderService and additional information from other Summit systems, including experimental and engineering data
    * USDF for staff and analytical uses
        * Largest, contains a full replica of the Summit plus additional information from USDF systems including Prompt Processing and Data Release Production, possibly Calibration Products Production, and human annotations from processing campaigns
    * Release for science users
        * Near-real-time "prompt" ConsDB replicates a subset of the USDF version
        * Data Release ConsDB is a snapshot of a subset of the USDF version with data pertaining to the exposures/visits in the DR
* Schema browser

* Versioning
Is the ConsDB versioning strategy outlined someplace in terms of when the major/minor/patch numbers in the schema versions should be incremented based on which changes are being made? (edited) 
We have defined a versioning strategy for the services of monthly YY.0M.DD, but I am not clear if that lines up with the schemas or if they are separate
I believe it is completely separate because the schemas are using semantic versioning.
I thought you defined semantic versioning for sdm_schemas somewhere, but it should be consistent across all schemas, not just ConsDB.

We've never defined this for sdm_schemas generically but it is definitely worth discussing.


My own take is incrementing like:
major: backward incompatible changes to the database objects (adding a table, deleting a column)
minor: backward compatible changes to the database objects (adding a column)
patch: updates or additions to semantics/metdata (units, UCDs, etc.)

The DP schemas don't use versioning, though some other schemas like apdb do have meaningful versions. (edited) 
The Felis data format basically leaves this open ended so that a version can be any string and their meaning is up to the schema author. (edited) 
The only philosophical issue I have is that adding a table is not usually backward-incompatible, but it is a major change.
I guess there's also a philosophical issue in terms of changing units/UCDs/descriptions in ways that are not actually compatible (modifications rather than clarifications).  If all of a sudden something is in mm rather than µm, it's not compatible.

And we should say what should happen in the case of changes to primary/foreign keys.  Again, there can be changes (like recent ones) that are semantically neutral/backward-compatible (because anything becoming non-primary is still unique and anything becoming primary was already unique), or there can be ones that are not.
https://rubin-obs.slack.com/archives/C07QJMQ7L4A/p1730482605167509
