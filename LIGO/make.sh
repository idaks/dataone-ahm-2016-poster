#!/usr/bin/env bash

# set variables
source ../settings.sh

# create output directories
mkdir -p $FACTS_DIR
mkdir -p $VIEWS_DIR
mkdir -p $RESULTS_DIR

# export YW model facts
$YW_CMD model $SCRIPT_DIR/GW150914_tutorial_uri.py \
        -c extract.language=python \
        -c extract.factsfile=$FACTS_DIR/yw_extract_facts.P \
        -c model.factsfile=$FACTS_DIR/yw_model_facts.P \
        -c query.engine=xsb

# materialize views of YW facts
$QUERIES_DIR/materialize_yw_views.sh > $VIEWS_DIR/yw_views.P

# draw complete workflow graph
$QUERIES_DIR/render_complete_wf_graph.sh > $RESULTS_DIR/complete_wf_graph.gv
dot -Tpdf $RESULTS_DIR/complete_wf_graph.gv > $RESULTS_DIR/complete_wf_graph.pdf

# list workflow outputs
$QUERIES_DIR/list_workflow_outputs.sh > $RESULTS_DIR/workflow_outputs.txt


##############
#   Q1_pro   #
##############

# draw worfklow graph upstream of shifted_wavefile
$QUERIES_DIR/render_wf_graph_upstream_of_data.sh shifted_wavefile > $RESULTS_DIR/wf_upstream_of_shifted_wavefile.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_shifted_wavefile.gv > $RESULTS_DIR/wf_upstream_of_shifted_wavefile.pdf

# draw worfklow graph upstream of WHITENED_strain_data
$QUERIES_DIR/render_wf_graph_upstream_of_data.sh \'WHITENED_strain_data\' > $RESULTS_DIR/wf_upstream_of_WHITENED_strain_data.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_WHITENED_strain_data.gv > $RESULTS_DIR/wf_upstream_of_WHITENED_strain_data.pdf

# draw worfklow graph upstream of COEFFICIENTS 
$QUERIES_DIR/render_wf_graph_upstream_of_data.sh \'COEFFICIENTS\' > $RESULTS_DIR/wf_upstream_of_COEFFICIENTS.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_COEFFICIENTS.gv > $RESULTS_DIR/wf_upstream_of_COEFFICIENTS.pdf
