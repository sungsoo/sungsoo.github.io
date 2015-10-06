Integrate with BlinkDB


INPUT: SELECT AVG(attr1) FROM table WHERE pred(attrs);
SampleClean: SELECT SUM(sf*cleaned_attr1/dup)/SUM(sf/dup) FROM join_table WHERE pred(cleaned_attrs);
BiasCorrected: SELECT SUM((dirty_attr1*pred(dirty_attrs)-cleaned_attr1*pred(clean_attrs)/dup)*sf)/SUM(pred(clean_attrs)*sf/dup) FROM join_table WHERE pred(dirty_attrs) or pred(cleaned_attrs);



INPUT: SELECT SUM(attr1) FROM table WHERE pred(attrs);
SampleClean: SELECT SUM(sf*cleaned_attr1/dup) FROM join_table WHERE pred(cleaned_attrs);
BiasCorrected: SELECT SUM((dirty_attr1*pred(dirty_attrs)-cleaned_attr1*pred(clean_attrs)/dup)*sf) FROM join_table WHERE pred(dirty_attrs) or pred(cleaned_attrs);


INPUT: SELECT COUNT(*) FROM table WHERE pred(attrs);
SampleClean: SELECT SUM(sf/dup) FROM join_table WHERE pred(cleaned_attrs); 
BiasCorrected: SELECT SUM((pred(dirty_attrs)-pred(clean_attrs)/dup)*sf) FROM join_table WHERE pred(dirty_attrs) or pred(cleaned_attrs);


