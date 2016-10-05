#!/usr/bin/env bash
#
ProvidedDataName=$1
PrintProvidedDataName=$2

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

['$RULES_DIR/general_rules'].
['$VIEWS_DIR/yw_views'].
['$RULES_DIR/yw_rules'].

set_prolog_flag(unknown, fail).

%-------------------------------------------------------------------------------
banner( 'Q2_Pro',
        'List the script inputs that are upstream of data product $PrintProvidedDataName.',
        'q2_pro(DataProduct, InputDataName)').
[user].
:- table q2_pro/2.
q2_pro(DataProduct, InputDataName):-
    yw_data(D1, _, _, _),
    yw_data(D2, DataProduct, _, _),
    yw_data_downstream(D1, D2),
    yw_workflow(_, W, nil, _, _, _),
    yw_inflow(_, W, D1, InputDataName, _, _).
end_of_file.

printall(q2_pro($ProvidedDataName, _)).

%-------------------------------------------------------------------------------


END_XSB_STDIN
