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


# copy reconfacts.P  into facts folder
cp -f recon/reconfacts.P facts

# draw complete workflow graph
$QUERIES_DIR/render_complete_wf_graph.sh > $RESULTS_DIR/complete_wf_graph.gv
dot -Tpdf $RESULTS_DIR/complete_wf_graph.gv > $RESULTS_DIR/complete_wf_graph.pdf

# draw complete workflow graph with URI template
$YW_CMD graph $SCRIPT_DIR/GW150914_tutorial_uri.py \
        -c graph.view=combined \
        -c graph.layout=tb \
        > $RESULTS_DIR/complete_wf_graph_uri.gv
dot -Tpdf $RESULTS_DIR/complete_wf_graph_uri.gv > $RESULTS_DIR/complete_wf_graph_uri.pdf

# list workflow outputs
$QUERIES_DIR/list_workflow_outputs.sh > $RESULTS_DIR/workflow_outputs.txt


##############
#   Q1_pro   #
##############

# draw worfklow graph upstream of shifted_wavefile
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh shifted_wavefile > $RESULTS_DIR/wf_upstream_of_shifted_wavefile.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_shifted_wavefile.gv > $RESULTS_DIR/wf_upstream_of_shifted_wavefile.pdf

# draw worfklow graph upstream of WHITENED_strain_data
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'WHITENED_strain_data\' > $RESULTS_DIR/wf_upstream_of_WHITENED_strain_data.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_WHITENED_strain_data.gv > $RESULTS_DIR/wf_upstream_of_WHITENED_strain_data.pdf

# draw worfklow graph upstream of whitened_bandpass_wavefile 
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'whitened_bandpass_wavefile\' > $RESULTS_DIR/wf_upstream_of_whitened_bandpass_wavefile.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_whitened_bandpass_wavefile.gv > $RESULTS_DIR/wf_upstream_of_whitened_bandpass_wavefile.pdf

# draw worfklow graph upstream of spectrogram_whitened 
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'spectrogram_whitened\' > $RESULTS_DIR/wf_upstream_of_spectrogram_whitened.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_spectrogram_whitened.gv > $RESULTS_DIR/wf_upstream_of_spectrogram_whitened.pdf

# draw worfklow graph upstream of H1_strain_filtered 
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'H1_strain_filtered\' > $RESULTS_DIR/wf_upstream_of_H1_strain_filtered.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_H1_strain_filtered.gv > $RESULTS_DIR/wf_upstream_of_H1_strain_filtered.pdf

# draw worfklow graph upstream of H1_strain_unfiltered 
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'H1_strain_unfiltered\' > $RESULTS_DIR/wf_upstream_of_H1_strain_unfiltered.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_H1_strain_unfiltered.gv > $RESULTS_DIR/wf_upstream_of_H1_strain_unfiltered.pdf

# draw worfklow graph upstream of filtered_white_noise_data 
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'filtered_white_noise_data\' > $RESULTS_DIR/wf_upstream_of_filtered_white_noise_data.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_filtered_white_noise_data.gv > $RESULTS_DIR/wf_upstream_of_filtered_white_noise_data.pdf

# draw worfklow graph upstream of ASDs 
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'ASDs\' > $RESULTS_DIR/wf_upstream_of_ASDs.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_ASDs.gv > $RESULTS_DIR/wf_upstream_of_ASDs.pdf

# draw worfklow graph upstream of H1_ASD_SamplingRate 
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'H1_ASD_SamplingRate\' > $RESULTS_DIR/wf_upstream_of_H1_ASD_SamplingRate.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_H1_ASD_SamplingRate.gv > $RESULTS_DIR/wf_upstream_of_H1_ASD_SamplingRate.pdf


# draw worfklow graph upstream of spectrogram
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'spectrogram\' > $RESULTS_DIR/wf_upstream_of_spectrogram.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_spectrogram.gv > $RESULTS_DIR/wf_upstream_of_spectrogram.pdf

# draw worfklow graph upstream of COEFFICIENTS 
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'COEFFICIENTS\' > $RESULTS_DIR/wf_upstream_of_COEFFICIENTS.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_COEFFICIENTS.gv > $RESULTS_DIR/wf_upstream_of_COEFFICIENTS.pdf


# draw worfklow graph upstream of FN_Sampling_rate 
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'FN_Sampling_rate\' > $RESULTS_DIR/wf_upstream_of_FN_Sampling_rate.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_FN_Sampling_rate.gv > $RESULTS_DIR/wf_upstream_of_FN_Sampling_rate.pdf


# draw worfklow graph upstream of FN_Detector 
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'FN_Detector\' > $RESULTS_DIR/wf_upstream_of_FN_Detector.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_FN_Detector.gv > $RESULTS_DIR/wf_upstream_of_FN_Detector.pdf


##############
#   Q2_pro   #
##############

# list workflow outputs
$QUERIES_DIR/list_dependent_inputs_q2.sh > $RESULTS_DIR/q2_pro_outputs.txt

##############
#   Q3_pro   #
##############

# draw worfklow graph downstream of FN_Sampling_rate
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh \'FN_Sampling_rate\' > $RESULTS_DIR/wf_downstream_of_FN_Sampling_rate.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_FN_Sampling_rate.gv > $RESULTS_DIR/wf_downstream_of_FN_Sampling_rate.pdf

# draw worfklow graph downstream of FN_Detector
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh \'FN_Detector\' > $RESULTS_DIR/wf_downstream_of_FN_Detector.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_FN_Detector.gv > $RESULTS_DIR/wf_downstream_of_FN_Detector.pdf

# draw worfklow graph downstream of fs
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh fs > $RESULTS_DIR/wf_downstream_of_fs.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_fs.gv > $RESULTS_DIR/wf_downstream_of_fs.pdf

# draw worfklow graph downstream of shifted_wavefile
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh shifted_wavefile > $RESULTS_DIR/wf_downstream_of_shifted_wavefile.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_shifted_wavefile.gv > $RESULTS_DIR/wf_downstream_of_shifted_wavefile.pdf

# draw worfklow graph downstream of strain_L1_whitenbp
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh strain_L1_whitenbp > $RESULTS_DIR/wf_downstream_of_strain_L1_whitenbp.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_strain_L1_whitenbp.gv > $RESULTS_DIR/wf_downstream_of_strain_L1_whitenbp.pdf

##############
#   Q4_pro   #
##############

# list workflow outputs
$QUERIES_DIR/list_dependent_outputs_q4.sh > $RESULTS_DIR/q4_pro_outputs.txt


##############
#   Q5_pro   #
##############

# draw recon worfklow graph upstream of shifted_wavefile
$QUERIES_DIR/render_wf_recon_graph_upstream_of_data_q5.sh shifted_wavefile > $RESULTS_DIR/wf_recon_upstream_of_shifted_wavefile.gv
dot -Tpdf $RESULTS_DIR/wf_recon_upstream_of_shifted_wavefile.gv > $RESULTS_DIR/wf_recon_upstream_of_shifted_wavefile.pdf

# draw recon worfklow graph upstream of whitened_bandpass_wavefile
$QUERIES_DIR/render_wf_recon_graph_upstream_of_data_q5.sh whitened_bandpass_wavefile > $RESULTS_DIR/wf_recon_upstream_of_whitened_bandpass_wavefile.gv
dot -Tpdf $RESULTS_DIR/wf_recon_upstream_of_whitened_bandpass_wavefile.gv > $RESULTS_DIR/wf_recon_upstream_of_whitened_bandpass_wavefile.pdf

##############
#   Q6_pro   #
##############


# draw recon workflow graph with all observables

$QUERIES_DIR/render_recon_complete_wf_graph_q6.sh > $RESULTS_DIR/wf_recon_complete_graph_all_observables.gv
dot -Tpdf $RESULTS_DIR/wf_recon_complete_graph_all_observables.gv > $RESULTS_DIR/wf_recon_complete_graph_all_observables.pdf
