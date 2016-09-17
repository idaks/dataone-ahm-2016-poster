#!/usr/bin/env bash

# set variables
source ../settings.sh

# create output directories
mkdir -p $FACTS_DIR
mkdir -p $VIEWS_DIR
mkdir -p $RESULTS_DIR

# export YW model facts
$YW_CMD model $SCRIPT_DIR/simulate_data_collection.py \
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

# draw worfklow graph upstream of corrected_image
$QUERIES_DIR/render_wf_graph_upstream_of_data.sh corrected_image > $RESULTS_DIR/wf_upstream_of_corrected_image.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_corrected_image.gv > $RESULTS_DIR/wf_upstream_of_corrected_image.pdf

# draw worfklow graph upstream of rejection_log
$QUERIES_DIR/render_wf_graph_upstream_of_data.sh rejection_log > $RESULTS_DIR/wf_upstream_of_rejection_log.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_rejection_log.gv > $RESULTS_DIR/wf_upstream_of_rejection_log.pdf

