#!/usr/bin/env bash

# set variables
source ../settings.sh

# create output directories
mkdir -p $FACTS_DIR
mkdir -p $VIEWS_DIR
mkdir -p $RESULTS_DIR

# export YW model facts
$YW_CMD model $SCRIPT_DIR/C3_C4_map_present_NA_with_comments.m \
        -c extract.language=matlab \
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

# draw worfklow graph upstream of C3_fraction_data
$QUERIES_DIR/render_wf_graph_upstream_of_data.sh \'C3_fraction_data\' > $RESULTS_DIR/wf_upstream_of_C3_fraction_data.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_C3_fraction_data.gv > $RESULTS_DIR/wf_upstream_of_C3_fraction_data.pdf

# draw worfklow graph upstream of C4_fraction_data
$QUERIES_DIR/render_wf_graph_upstream_of_data.sh \'C4_fraction_data\' > $RESULTS_DIR/wf_upstream_of_C4_fraction_data.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_C4_fraction_data.gv > $RESULTS_DIR/wf_upstream_of_C4_fraction_data.pdf

# draw worfklow graph upstream of Grass_fraction_data
$QUERIES_DIR/render_wf_graph_upstream_of_data.sh \'Grass_fraction_data\' > $RESULTS_DIR/wf_upstream_of_Grass_fraction_data.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_Grass_fraction_data.gv > $RESULTS_DIR/wf_upstream_of_Grass_fraction_data.pdf


# draw worfklow graph upstream of mean_precip
$QUERIES_DIR/render_wf_graph_upstream_of_data.sh mean_precip > $RESULTS_DIR/wf_upstream_of_mean_precip.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_mean_precip.gv > $RESULTS_DIR/wf_upstream_of_mean_precip.pdf


##############
#   Q2_pro   #
##############

# list workflow outputs
./q2-q4-queries/q2.sh > $RESULTS_DIR/q2_pro_outputs.txt


##############
#   Q4_pro   #
##############

# list workflow outputs
./q2-q4-queries/q4.sh > $RESULTS_DIR/q4_pro_outputs.txt


##############
#   Q5_pro   #
##############


# draw recon worfklow graph upstream of C3_fraction_data
./render_wf_recon_graph_upstream_of_data.sh \'C3_fraction_data\' > $RESULTS_DIR/wf_recon_upstream_of_C3_fraction_data.gv
dot -Tpdf $RESULTS_DIR/wf_recon_upstream_of_C3_fraction_data.gv > $RESULTS_DIR/wf_recon_upstream_of_C3_fraction_data.pdf
