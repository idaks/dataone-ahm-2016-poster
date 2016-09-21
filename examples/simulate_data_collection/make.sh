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
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh corrected_image > $RESULTS_DIR/wf_upstream_of_corrected_image.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_corrected_image.gv > $RESULTS_DIR/wf_upstream_of_corrected_image.pdf

# draw worfklow graph upstream of rejection_log
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh rejection_log > $RESULTS_DIR/wf_upstream_of_rejection_log.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_rejection_log.gv > $RESULTS_DIR/wf_upstream_of_rejection_log.pdf

##############
#   Q2_pro   #
##############

# list script inputs upstream of output data corrected_image
$QUERIES_DIR/list_inputs_upstream_of_data_q2.sh corrected_image > $RESULTS_DIR/inputs_upstream_of_corrected_image.txt

# list script inputs upstream of intermediate data sample_quality
$QUERIES_DIR/list_inputs_upstream_of_data_q2.sh sample_quality > $RESULTS_DIR/inputs_upstream_of_sample_quality.txt

##############
#   Q3_pro   #
##############

# draw workflow graph downstream of calibration_image
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh calibration_image > $RESULTS_DIR/wf_downstream_of_calibration_image.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_calibration_image.gv > $RESULTS_DIR/wf_downstream_of_calibration_image.pdf

##############
#   Q4_pro   #
##############

# list workflow outputs downstream of cassette_id
$QUERIES_DIR/list_outputs_downstream_of_data_q4.sh cassette_id > $RESULTS_DIR/outputs_downstream_of_cassette_id.txt

# list workflow outputs downstream of pixel_count
$QUERIES_DIR/list_outputs_downstream_of_data_q4.sh pixel_count > $RESULTS_DIR/outputs_downstream_of_pixel_count.txt
