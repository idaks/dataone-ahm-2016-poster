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

# copy reconfacts.P into facts/ folder
cp -f recon/reconfacts.P facts/

# draw complete workflow graph
$QUERIES_DIR/render_complete_wf_graph.sh > $RESULTS_DIR/complete_wf_graph.gv
dot -Tpdf $RESULTS_DIR/complete_wf_graph.gv > $RESULTS_DIR/complete_wf_graph.pdf

# draw complete workflow graph with URI template
$YW_CMD graph $SCRIPT_DIR/C3_C4_map_present_NA_with_comments.m \
        -c graph.view=combined \
        -c graph.layout=tb \
        > $RESULTS_DIR/complete_wf_graph_uri.gv
dot -Tpdf $RESULTS_DIR/complete_wf_graph_uri.gv > $RESULTS_DIR/complete_wf_graph_uri.pdf

# list workflow outputs
$QUERIES_DIR/list_workflow_outputs.sh > $RESULTS_DIR/workflow_outputs.txt


##############
#   Q1_pro   #
##############

# draw worfklow graph upstream of C3_fraction_data
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'C3_fraction_data\' > $RESULTS_DIR/wf_upstream_of_C3_fraction_data.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_C3_fraction_data.gv > $RESULTS_DIR/wf_upstream_of_C3_fraction_data.pdf

# draw worfklow graph upstream of C4_fraction_data
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'C4_fraction_data\' > $RESULTS_DIR/wf_upstream_of_C4_fraction_data.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_C4_fraction_data.gv > $RESULTS_DIR/wf_upstream_of_C4_fraction_data.pdf

# draw worfklow graph upstream of Grass_fraction_data
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'Grass_fraction_data\' > $RESULTS_DIR/wf_upstream_of_Grass_fraction_data.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_Grass_fraction_data.gv > $RESULTS_DIR/wf_upstream_of_Grass_fraction_data.pdf

# draw worfklow graph upstream of mean_precip
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh mean_precip > $RESULTS_DIR/wf_upstream_of_mean_precip.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_mean_precip.gv > $RESULTS_DIR/wf_upstream_of_mean_precip.pdf


##############
#   Q2_pro   #
##############

# list workflow outputs
$QUERIES_DIR/list_dependent_inputs_q2.sh > $RESULTS_DIR/q2_pro_outputs.txt


##############
#   Q3_pro   #
##############


# draw worfklow graph downstream of mean_precip
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh mean_precip > $RESULTS_DIR/wf_downstream_of_mean_precip.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_mean_precip.gv > $RESULTS_DIR/wf_downstream_of_mean_precip.pdf

# draw worfklow graph downstream of mean_airtemp
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh mean_airtemp > $RESULTS_DIR/wf_downstream_of_mean_airtemp.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_mean_airtemp.gv > $RESULTS_DIR/wf_downstream_of_mean_airtemp.pdf

# draw worfklow graph downstream of SYNMAP_land_cover_map_data
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh \'SYNMAP_land_cover_map_data\'> $RESULTS_DIR/wf_downstream_of_SYNMAP_land_cover_map_data.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_SYNMAP_land_cover_map_data.gv > $RESULTS_DIR/wf_downstream_of_SYNMAP_land_cover_map_data.pdf

# draw worfklow graph downstream of lat_variable
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh lat_variable > $RESULTS_DIR/wf_downstream_of_lat_variable.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_lat_variable.gv > $RESULTS_DIR/wf_downstream_of_lat_variable.pdf

# draw worfklow graph downstream of Grass_variable
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh \'Grass_variable\' > $RESULTS_DIR/wf_downstream_of_Grass_variable.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_Grass_variable.gv > $RESULTS_DIR/wf_downstream_of_Grass_variable.pdf


##############
#   Q4_pro   #
##############

# list workflow outputs
$QUERIES_DIR/list_dependent_outputs_q4.sh > $RESULTS_DIR/q4_pro_outputs.txt


##############
#   Q5_pro   #
##############

# draw recon worfklow graph upstream of C3_fraction_data
$QUERIES_DIR/render_wf_recon_graph_upstream_of_data_q5.sh \'C3_fraction_data\' > $RESULTS_DIR/wf_recon_upstream_of_C3_fraction_data.gv
dot -Tpdf $RESULTS_DIR/wf_recon_upstream_of_C3_fraction_data.gv > $RESULTS_DIR/wf_recon_upstream_of_C3_fraction_data.pdf


# draw recon worfklow graph upstream of C4_fraction_data
$QUERIES_DIR/render_wf_recon_graph_upstream_of_data_q5.sh \'C4_fraction_data\' > $RESULTS_DIR/wf_recon_upstream_of_C4_fraction_data.gv
dot -Tpdf $RESULTS_DIR/wf_recon_upstream_of_C4_fraction_data.gv > $RESULTS_DIR/wf_recon_upstream_of_C4_fraction_data.pdf


# draw recon worfklow graph upstream of Grass_fraction_data
$QUERIES_DIR/render_wf_recon_graph_upstream_of_data_q5.sh \'Grass_fraction_data\' > $RESULTS_DIR/wf_recon_upstream_of_Grass_fraction_data.gv
dot -Tpdf $RESULTS_DIR/wf_recon_upstream_of_Grass_fraction_data.gv > $RESULTS_DIR/wf_recon_upstream_of_Grass_fraction_data.pdf
