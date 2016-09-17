#!/usr/bin/env bash
#

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

['$RULES_DIR/general_rules'].
['$VIEWS_DIR/yw_views'].
['$RULES_DIR/yw_rules'].

set_prolog_flag(unknown, fail).

%-------------------------------------------------------------------------------
banner( 'Q2_Pro',
        'List the script inputs that are upstream of a given data product D.',
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

printall(q2_pro('C3_fraction_data', _)).
printall(q2_pro('C4_fraction_data', _)).
printall(q2_pro('Grass_fraction_data', _)).

printall(q2_pro('shifted_wavefile', _)).
printall(q2_pro('WHITENED_strain_data', _)).
printall(q2_pro('whitened_bandpass_wavefile', _)).
printall(q2_pro('spectrogram_whitened', _)).
printall(q2_pro('H1_strain_filtered', _)).
printall(q2_pro('H1_strain_unfiltered', _)).
printall(q2_pro('filtered_white_noise_data', _)).
printall(q2_pro('ASDs', _)).
printall(q2_pro('H1_ASD_SamplingRate', _)).
printall(q2_pro('spectrogram', _)).

%-------------------------------------------------------------------------------


END_XSB_STDIN
