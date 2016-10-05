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
banner( 'Q4_Pro',
        'List the outputs that depend on $PrintProvidedDataName.',
        'q4_pro(UpstreamDataName, OutputDataName)').
[user].
:- table q4_pro/2.
q4_pro(UpstreamDataName, OutputDataName):-
    yw_data(D1, UpstreamDataName, _, _),
    yw_data(D2, _, _, _),
    yw_data_downstream(D1, D2),
    yw_workflow(_, W, nil, _, _, _),
    yw_outflow(_, _, D2, OutputDataName, _, W, _, _).
end_of_file.

printall(q4_pro($ProvidedDataName, _)).
%-------------------------------------------------------------------------------

END_XSB_STDIN
