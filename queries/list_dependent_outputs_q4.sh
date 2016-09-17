#!/usr/bin/env bash
#

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

['$RULES_DIR/general_rules'].
['$VIEWS_DIR/yw_views'].
['$RULES_DIR/yw_rules'].

set_prolog_flag(unknown, fail).

%-------------------------------------------------------------------------------
banner( 'Q4_Pro',
        'List the outputs that depend on a particular script input.',
        'q4_pro(InputDataName, OutputDataName)').
[user].
:- table q4_pro/2.
q4_pro(InputDataName, OutputDataName):-
    yw_data(D1, InputDataName, _, _),
    yw_data(D2, _, _, _),
    yw_data_downstream(D1, D2),
    yw_workflow(_, W, nil, _, _, _),
    yw_outflow(_, _, D2, OutputDataName, _, W, _, _).
end_of_file.

printall(q4_pro('mean_airtemp', _)).
printall(q4_pro('mean_precip', _)).
printall(q4_pro('SYNMAP_land_cover_map_data', _)).


printall(q4_pro('FN_Sampling_rate', _)).
printall(q4_pro('FN_Detector', _)).
printall(q4_pro('fs', _)).
%-------------------------------------------------------------------------------


END_XSB_STDIN
