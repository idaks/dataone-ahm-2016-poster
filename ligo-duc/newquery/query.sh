#!/usr/bin/env bash
#
# ./run_queries.sh &> run_queries.txt

xsb --quietload --noprompt --nofeedback --nobanner << END_XSB_STDIN

['rules/general_rules'].
['rules/yw_rules.P'].
['views/yw_views'].
['facts/yw_model_facts'].

set_prolog_flag(unknown, fail).

%-------------------------------------------------------------------------------
banner( 'YW_Q1',
        'Where is the definition of block SPECTROGRAMS_1 and SPECTROGRAMS_2?',
        'yw_q1(WorkflowName, Description)').
[user].
:- table yw_q1/3.
yw_q1(ProgramName, BeginLine, EndLine) :-
    yw_program(_, ProgramName, _, _, BeginLine, EndLine).
end_of_file.

printall(yw_q1('SPECTROGRAMS_1', _, _)).
printall(yw_q1('SPECTROGRAMS_2', _, _)).
%-------------------------------------------------------------------------------



%-------------------------------------------------------------------------------
banner( 'YW_Q2',
        'What is the name and description of the workflow implemented by the script?',
        'yw_q2(WorkflowName, Description)').
[user].
:- table yw_q2/2.
yw_q2(WorkflowName, Description) :-
    yw_workflow_script(WorkflowId, WorkflowName, _,_),
    yw_description(program, WorkflowId, _, Description).
end_of_file.
printall(yw_q2(_,_)).
%-------------------------------------------------------------------------------



%-------------------------------------------------------------------------------
banner( 'YW_Q3',
        'What workflow steps comprise the top-level workflow?',
        'yw_q3(StepName, Description)').
[user].
:- table yw_q3/2.
yw_q3(StepName, Description) :-
    yw_workflow_script(WorkflowId,_,_,_),
    yw_workflow_step(StepId, StepName, WorkflowId, _, _, _),
    yw_description(program, StepId, _, Description).
end_of_file.
printall(yw_q3(_,_)).
%-------------------------------------------------------------------------------



%-------------------------------------------------------------------------------
banner( 'YW_Q4',
        'Where is the definition of workflow step AMPLITUDE_SPECTRAL_DENSITY?',
        'yw_q4(SourceFile, StartLine, EndLine)').
[user].
:- table yw_q4/3.
yw_q4(SourceFile, StartLine, EndLine) :-
    yw_workflow_script(WorkflowId,_,_,_),
    yw_workflow_step(_, 'AMPLITUDE_SPECTRAL_DENSITY', WorkflowId, SourceId, StartLine, EndLine),
    yw_source_file(SourceId, SourceFile).
end_of_file.
printall(yw_q4(_,_,_)).
%-------------------------------------------------------------------------------



%-------------------------------------------------------------------------------
banner( 'YW_Q5',
        'What are the names and descriptions of any outputs of the workflow?',
        'yw_q4(OutputName, Description)').
[user].
:- table yw_q5/2.
yw_q5(OutputName, Description) :-
    yw_workflow_script(WorkflowId,_,_,_),
    yw_step_output(WorkflowId, _, _, PortId, _,_, OutputName),
    yw_description(port, PortId, _, Description).
end_of_file.
printall(yw_q5(_,_)).
%-------------------------------------------------------------------------------



%-------------------------------------------------------------------------------
banner( 'YW_Q6',
        'What data flows from the AMPLITUDE_SPECTRAL_DENSITY workflow step to the WHITENING step?',
        'yw_q6(DataName)').
[user].
:- table yw_q6/1.
yw_q6(DataName) :-
    yw_flow(_, 'AMPLITUDE_SPECTRAL_DENSITY', _, _,  _, DataName, _, _, _, 'WHITENING').
end_of_file.
printall(yw_q6(_)).
%-------------------------------------------------------------------------------



%-------------------------------------------------------------------------------
banner( 'YW_Q7',
        'Which final outputs depend on the input FN_H1 ?',
        'yw_q7(FN_H1, NewDataName)').

[user].
:- table yw_q7/2.
yw_q7(DataName, NewDataName) :-
    yw_step_input(_, ProgramName, _, _, _, _, DataName),
    yw_step_output(_, ProgramName, _, _, _, _, NewDataName).
end_of_file.


printall(yw_q7('FN_H1', _)).
%-------------------------------------------------------------------------------



%-------------------------------------------------------------------------------
banner( 'YW_Q8',
        'Which final outputs and intermediate outputs depend on the input FN_H1 ?',
        'yw_q8(AncestorData, ChildData)').

[user].
:- table yw_q8/2.
yw_q8(AncestorData, ChildData) :-
    ancestor(AncestorData, ChildData).


:- table ancestor/2.
ancestor(AncestorData, ChildData):-  
    parent(ParentData, ChildData),
    ancestor(AncestorData, ParentData).

ancestor(ParentData, ChildData):-             
    parent(ParentData, ChildData).

:- table parent/2.
parent(ParentData, ChildData) :-
    yw_step_input(_, ProgramName, _, _, _, _, ParentData),
    yw_step_output(_, ProgramName, _, _, _, _, ChildData).
end_of_file.


printall(yw_q8('FN_H1', _)).
%-------------------------------------------------------------------------------
yw_workflow_script(_, WorkflowName, _, _),
yw_data(_, AncestorData, _, WorkflowName),


%-------------------------------------------------------------------------------
banner( 'YW_Q9',
        'Which inputs does the output GW150914_H1_whitenbp.wav depend on ?',
        'yw_q9(DataNameIn, GW150914_H1_whitenbp.wav)').

[user].
:- table yw_q9/2.
yw_q9(DataNameIn, DataNameOut) :-
    yw_step_output(_, ProgramName, _, _, _, _, DataNameOut),
    yw_step_input(_, ProgramName, _, _, _, _, DataNameIn).
end_of_file.


printall(yw_q9(_, 'GW150914_H1_whitenbp.wav')).
%-------------------------------------------------------------------------------



%-------------------------------------------------------------------------------
banner( 'YW_1Q',
        'What programs have input ports that receive data strain_H1_whitenbp ?',
        'yw_q10(DataNameIn, GW150914_H1_whitenbp.wav)').

[user].
:- table yw_q10/2.
yw_q10(DataNameIn, ProgramName) :-
    yw_step_input(_, ProgramName, _, _, _, _, DataNameIn).
end_of_file.


printall(yw_q10('strain_H1_whitenbp', _)).
%-------------------------------------------------------------------------------



%-------------------------------------------------------------------------------
banner( 'YW_11',
        'What are the names and descriptions of the inputs to the top-level workflow ?',
        'yw_q11(DataNameIn)').

[user].
:- table yw_q11/1.
yw_q11(DataNameIn) :-
    yw_inflow(_, _, _, DataNameIn, _, _).
end_of_file.
printall(yw_q11( _)).
%-------------------------------------------------------------------------------



%-------------------------------------------------------------------------------
banner( 'YW_12',
        'What program blocks provide input directly to SPECTROGRAMS_1 and SPECTROGRAMS_2 ?',
        'yw_q12(SourceProgramName, SinkProgramName) ').

[user].
:- table yw_q12/2.
yw_q12(SourceProgramName, SinkProgramName) :-
    yw_flow(_, SourceProgramName, _, _, _, _, _, _, _, SinkProgramName).
end_of_file.
printall(yw_q12( _, 'SPECTROGRAMS_1')).
printall(yw_q12( _, 'SPECTROGRAMS_2')).
%-------------------------------------------------------------------------------



%-------------------------------------------------------------------------------
banner( 'YW_13',
        'What programs have input ports that receive data strain_H1_whitenbp ?',
        'yw_q13(SinkPortName, SinkProgramName)').

[user].
:- table yw_q13/2.
yw_q13(SinkPortName, SinkProgramName) :-
    yw_flow(_, _, _, _, _, _, _, SinkPortName, _, SinkProgramName).
end_of_file.
printall(yw_q13('strain_H1_whitenbp', _)).
%-------------------------------------------------------------------------------



%-------------------------------------------------------------------------------
banner( 'YW_14',
        'How many ports read data strain_H1_whitenbp?',
        'yw_q14(PortCount)').

[user].
:- table yw_q14/1.
yw_q14(PortCount) :-
    count(yw_flow(_, _, _, _, _, 'strain_H1_whitenbp', _, _, _, _), PortCount). 
end_of_file.

printall(yw_q14( _)).
%-------------------------------------------------------------------------------



%-------------------------------------------------------------------------------
banner( 'YW_15',
        'How many data are read by more than 1 port in workflow?',
        'yw_q15(PortCount)').

[user].
:- table yw_q15/1.
yw_q15(DataCount) :-
    yw_workflow_script(WorkflowId,_,_,_),
    yw_workflow_step(_, WorkflowStep, WorkflowId, _, _, _),
    count(data_in_workflow_read_by_multiple_ports(WorkflowStep, _) , DataCount). 

data_in_workflow_read_by_multiple_ports(WorkflowStep, DataName) :-
    yw_step_input(_, WorkflowStep, _, _, _, _, DataName),
    data_in_port_count(PortCount, DataName),
    PortCount > 1.

data_in_port_count(PortCount, DataName) :-
    count(yw_step_input(_, _, _, _, _, _, DataName), PortCount). 
end_of_file.

printall(yw_q15( _)).
%-------------------------------------------------------------------------------


%-------------------------------------------------------------------------------
banner( 'YW_Q16',
        'The Lowest Common Ancestor (LCA) of a pair of nodes GW150914_H1_whitenbp.wav and GW150914_L1_whitenbp.wav',
        'yw_q16(GW150914_H1_whitenbp.wav,GW150914_L1_whitenbp.wav, AncestorData) ').

[user].
:- yw_q16/3.
yw_q16(ChildData1, ChildData2, AncestorData) :-
    lca(ChildData1, ChildData2, AncestorData).

:- table lca/3.
lca(ChildData1, ChildData2, AncestorData) :-
    common_ancestor(ChildData1, ChildData2, AncestorData), 
    not not_lca(ChildData1, ChildData2, AncestorData).


:- table not_lca/3.
not_lca(ChildData1, ChildData2, AncestorData) :-
    common_ancestor(ChildData1, ChildData2, AncestorData),
    common_ancestor(ChildData1, ChildData2, AncestorData1),
    ancestor(AncestorData, AncestorData1).


:- table common_ancestor/3.
common_ancestor(ChildData1, ChildData2, AncestorData) :-
    ancestor(AncestorData, ChildData1),
    ancestor(AncestorData, ChildData2). 


:- table ancestor/2.
ancestor(AncestorData, ChildData):-  
    parent(ParentData, ChildData),
    ancestor(AncestorData, ParentData).

ancestor(ParentData, ChildData):-             
    parent(ParentData, ChildData).

:- table parent/2.
parent(ParentData, ChildData) :-
    yw_step_input(_, ProgramName, _, _, _, _, ParentData),
    yw_step_output(_, ProgramName, _, _, _, _, ChildData).
end_of_file.

printall(yw_q16('GW150914_H1_whitenbp.wav','GW150914_L1_whitenbp.wav', _)).
printall(yw_q16('GW150914_H1_whitenbp.wav','GW150914_H1_shifted.wav', _)).
printall(yw_q16('GW150914_H1_whitenbp.wav','GW150914_H1_ASD_16384.png', _)).
printall(yw_q16('GW150914_H1_strain_filtered.png','GW150914_filter.png', _)).
%-------------------------------------------------------------------------------


%-------------------------------------------------------------------------------
banner( 'Q2_Pro',
        'List the script inputs that are upstream of a given data product D.',
        'Q2_Pro(DataProduct, InputPortName_alias)').

[user].
:- table q2_pro/2.
q2_pro(DataProduct, InputPortName_alias) :-
    yw_data(D1, UpstreamName, _, _),
    yw_data(D2, DataProduct, _, _),
    yw_data_downstream(D1, D2),
    workflow(W),
    has_in_port(W, P),
    port(P, 'in', InputPortName, _, _, D1),
    port_alias(P, InputPortName_alias).
end_of_file.


printall(q2_pro('spectrogram_whitened', _)).
%-------------------------------------------------------------------------------


END_XSB_STDIN
