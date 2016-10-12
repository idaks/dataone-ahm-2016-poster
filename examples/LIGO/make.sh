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
dot -Tsvg $RESULTS_DIR/complete_wf_graph_uri.gv > $RESULTS_DIR/complete_wf_graph_uri.svg

# list workflow outputs
$QUERIES_DIR/list_workflow_outputs.sh > $RESULTS_DIR/workflow_outputs.txt


##############
#   Q1_pro   #
##############

# draw worfklow graph upstream of shifted_wavefile
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh shifted_wavefile > $RESULTS_DIR/wf_upstream_of_shifted_wavefile.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_shifted_wavefile.gv > $RESULTS_DIR/wf_upstream_of_shifted_wavefile.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_shifted_wavefile.gv > $RESULTS_DIR/wf_upstream_of_shifted_wavefile.svg

# draw worfklow graph upstream of WHITENED_strain_data
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'WHITENED_strain_data\' > $RESULTS_DIR/wf_upstream_of_WHITENED_strain_data.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_WHITENED_strain_data.gv > $RESULTS_DIR/wf_upstream_of_WHITENED_strain_data.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_WHITENED_strain_data.gv > $RESULTS_DIR/wf_upstream_of_WHITENED_strain_data.svg

# draw worfklow graph upstream of whitened_bandpass_wavefile
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'whitened_bandpass_wavefile\' > $RESULTS_DIR/wf_upstream_of_whitened_bandpass_wavefile.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_whitened_bandpass_wavefile.gv > $RESULTS_DIR/wf_upstream_of_whitened_bandpass_wavefile.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_whitened_bandpass_wavefile.gv > $RESULTS_DIR/wf_upstream_of_whitened_bandpass_wavefile.svg

# draw worfklow graph upstream of spectrogram_whitened
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'spectrogram_whitened\' > $RESULTS_DIR/wf_upstream_of_spectrogram_whitened.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_spectrogram_whitened.gv > $RESULTS_DIR/wf_upstream_of_spectrogram_whitened.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_spectrogram_whitened.gv > $RESULTS_DIR/wf_upstream_of_spectrogram_whitened.svg

# draw worfklow graph upstream of H1_strain_filtered
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'H1_strain_filtered\' > $RESULTS_DIR/wf_upstream_of_H1_strain_filtered.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_H1_strain_filtered.gv > $RESULTS_DIR/wf_upstream_of_H1_strain_filtered.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_H1_strain_filtered.gv > $RESULTS_DIR/wf_upstream_of_H1_strain_filtered.svg

# draw worfklow graph upstream of H1_strain_unfiltered
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'H1_strain_unfiltered\' > $RESULTS_DIR/wf_upstream_of_H1_strain_unfiltered.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_H1_strain_unfiltered.gv > $RESULTS_DIR/wf_upstream_of_H1_strain_unfiltered.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_H1_strain_unfiltered.gv > $RESULTS_DIR/wf_upstream_of_H1_strain_unfiltered.svg

# draw worfklow graph upstream of filtered_white_noise_data
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'filtered_white_noise_data\' > $RESULTS_DIR/wf_upstream_of_filtered_white_noise_data.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_filtered_white_noise_data.gv > $RESULTS_DIR/wf_upstream_of_filtered_white_noise_data.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_filtered_white_noise_data.gv > $RESULTS_DIR/wf_upstream_of_filtered_white_noise_data.svg

# draw worfklow graph upstream of ASDs
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'ASDs\' > $RESULTS_DIR/wf_upstream_of_ASDs.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_ASDs.gv > $RESULTS_DIR/wf_upstream_of_ASDs.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_ASDs.gv > $RESULTS_DIR/wf_upstream_of_ASDs.svg

# draw worfklow graph upstream of H1_ASD_SamplingRate
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'H1_ASD_SamplingRate\' > $RESULTS_DIR/wf_upstream_of_H1_ASD_SamplingRate.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_H1_ASD_SamplingRate.gv > $RESULTS_DIR/wf_upstream_of_H1_ASD_SamplingRate.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_H1_ASD_SamplingRate.gv > $RESULTS_DIR/wf_upstream_of_H1_ASD_SamplingRate.svg

# draw worfklow graph upstream of spectrogram
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'spectrogram\' > $RESULTS_DIR/wf_upstream_of_spectrogram.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_spectrogram.gv > $RESULTS_DIR/wf_upstream_of_spectrogram.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_spectrogram.gv > $RESULTS_DIR/wf_upstream_of_spectrogram.svg

# draw worfklow graph upstream of COEFFICIENTS
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'COEFFICIENTS\' > $RESULTS_DIR/wf_upstream_of_COEFFICIENTS.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_COEFFICIENTS.gv > $RESULTS_DIR/wf_upstream_of_COEFFICIENTS.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_COEFFICIENTS.gv > $RESULTS_DIR/wf_upstream_of_COEFFICIENTS.svg

# draw worfklow graph upstream of FN_Sampling_rate
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'FN_Sampling_rate\' > $RESULTS_DIR/wf_upstream_of_FN_Sampling_rate.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_FN_Sampling_rate.gv > $RESULTS_DIR/wf_upstream_of_FN_Sampling_rate.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_FN_Sampling_rate.gv > $RESULTS_DIR/wf_upstream_of_FN_Sampling_rate.svg

# draw worfklow graph upstream of FN_Detector
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'FN_Detector\' > $RESULTS_DIR/wf_upstream_of_FN_Detector.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_FN_Detector.gv > $RESULTS_DIR/wf_upstream_of_FN_Detector.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_FN_Detector.gv > $RESULTS_DIR/wf_upstream_of_FN_Detector.svg


##############
#   Q2_pro   #
##############

# list workflow outputs
#$QUERIES_DIR/list_dependent_inputs_q2.sh > $RESULTS_DIR/q2_pro_outputs.txt

# list script inputs upstream of output data shifted_wavefile
$QUERIES_DIR/list_inputs_upstream_of_data_q2.sh shifted_wavefile shifted_wavefile > $RESULTS_DIR/inputs_upstream_of_shifted_wavefile.txt

# list script inputs upstream of output data WHITENED_strain_data
$QUERIES_DIR/list_inputs_upstream_of_data_q2.sh \'WHITENED_strain_data\' WHITENED_strain_data > $RESULTS_DIR/inputs_upstream_of_WHITENED_strain_data.txt

# list script inputs upstream of output data whitened_bandpass_wavefile
$QUERIES_DIR/list_inputs_upstream_of_data_q2.sh whitened_bandpass_wavefile whitened_bandpass_wavefile > $RESULTS_DIR/inputs_upstream_of_whitened_bandpass_wavefile.txt

# list script inputs upstream of output data spectrogram_whitened
$QUERIES_DIR/list_inputs_upstream_of_data_q2.sh spectrogram_whitened spectrogram_whitened > $RESULTS_DIR/inputs_upstream_of_spectrogram_whitened.txt

# list script inputs upstream of output data H1_strain_filtered
$QUERIES_DIR/list_inputs_upstream_of_data_q2.sh \'H1_strain_filtered\' H1_strain_filtered > $RESULTS_DIR/inputs_upstream_of_H1_strain_filtered.txt

# list script inputs upstream of output data H1_strain_unfiltered
$QUERIES_DIR/list_inputs_upstream_of_data_q2.sh \'H1_strain_unfiltered\' H1_strain_unfiltered > $RESULTS_DIR/inputs_upstream_of_H1_strain_unfiltered.txt

# list script inputs upstream of output data filtered_white_noise_data
$QUERIES_DIR/list_inputs_upstream_of_data_q2.sh filtered_white_noise_data filtered_white_noise_data > $RESULTS_DIR/inputs_upstream_of_filtered_white_noise_data.txt

# list script inputs upstream of output data ASDs
$QUERIES_DIR/list_inputs_upstream_of_data_q2.sh \'ASDs\' ASDs > $RESULTS_DIR/inputs_upstream_of_ASDs.txt


##############
#   Q3_pro   #
##############

# draw worfklow graph downstream of FN_Sampling_rate
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh \'FN_Sampling_rate\' > $RESULTS_DIR/wf_downstream_of_FN_Sampling_rate.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_FN_Sampling_rate.gv > $RESULTS_DIR/wf_downstream_of_FN_Sampling_rate.pdf
dot -Tsvg $RESULTS_DIR/wf_downstream_of_FN_Sampling_rate.gv > $RESULTS_DIR/wf_downstream_of_FN_Sampling_rate.svg

# draw worfklow graph downstream of FN_Detector
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh \'FN_Detector\' > $RESULTS_DIR/wf_downstream_of_FN_Detector.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_FN_Detector.gv > $RESULTS_DIR/wf_downstream_of_FN_Detector.pdf
dot -Tsvg $RESULTS_DIR/wf_downstream_of_FN_Detector.gv > $RESULTS_DIR/wf_downstream_of_FN_Detector.svg

# draw worfklow graph downstream of fs
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh fs > $RESULTS_DIR/wf_downstream_of_fs.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_fs.gv > $RESULTS_DIR/wf_downstream_of_fs.pdf
dot -Tsvg $RESULTS_DIR/wf_downstream_of_fs.gv > $RESULTS_DIR/wf_downstream_of_fs.svg

# draw worfklow graph downstream of shifted_wavefile
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh shifted_wavefile > $RESULTS_DIR/wf_downstream_of_shifted_wavefile.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_shifted_wavefile.gv > $RESULTS_DIR/wf_downstream_of_shifted_wavefile.pdf
dot -Tsvg $RESULTS_DIR/wf_downstream_of_shifted_wavefile.gv > $RESULTS_DIR/wf_downstream_of_shifted_wavefile.svg

# draw worfklow graph downstream of strain_L1_whitenbp
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh strain_L1_whitenbp > $RESULTS_DIR/wf_downstream_of_strain_L1_whitenbp.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_strain_L1_whitenbp.gv > $RESULTS_DIR/wf_downstream_of_strain_L1_whitenbp.pdf
dot -Tsvg $RESULTS_DIR/wf_downstream_of_strain_L1_whitenbp.gv > $RESULTS_DIR/wf_downstream_of_strain_L1_whitenbp.svg


##############
#   Q4_pro   #
##############

# list workflow outputs
#$QUERIES_DIR/list_dependent_outputs_q4.sh > $RESULTS_DIR/q4_pro_outputs.txt

# list script outputs downstream of input data FN_Sampling_rate
$QUERIES_DIR/list_outputs_downstream_of_data_q4.sh \'FN_Sampling_rate\' FN_Sampling_rate > $RESULTS_DIR/outputs_downstream_of_FN_Sampling_rate.txt

# list script outputs downstream of input data FN_Detector
$QUERIES_DIR/list_outputs_downstream_of_data_q4.sh \'FN_Detector\' FN_Detector > $RESULTS_DIR/outputs_downstream_of_FN_Detector.txt

# list script outputs downstream of input data fs
$QUERIES_DIR/list_outputs_downstream_of_data_q4.sh fs fs > $RESULTS_DIR/outputs_downstream_of_fs.txt


##############
#   Q5_pro   #
##############

# draw recon worfklow graph upstream of shifted_wavefile
$QUERIES_DIR/render_wf_recon_graph_upstream_of_data_q5.sh shifted_wavefile > $RESULTS_DIR/wf_recon_upstream_of_shifted_wavefile.gv
dot -Tpdf $RESULTS_DIR/wf_recon_upstream_of_shifted_wavefile.gv > $RESULTS_DIR/wf_recon_upstream_of_shifted_wavefile.pdf
dot -Tsvg $RESULTS_DIR/wf_recon_upstream_of_shifted_wavefile.gv > $RESULTS_DIR/wf_recon_upstream_of_shifted_wavefile.svg


# draw recon worfklow graph upstream of whitened_bandpass_wavefile
$QUERIES_DIR/render_wf_recon_graph_upstream_of_data_q5.sh whitened_bandpass_wavefile > $RESULTS_DIR/wf_recon_upstream_of_whitened_bandpass_wavefile.gv
dot -Tpdf $RESULTS_DIR/wf_recon_upstream_of_whitened_bandpass_wavefile.gv > $RESULTS_DIR/wf_recon_upstream_of_whitened_bandpass_wavefile.pdf
dot -Tsvg $RESULTS_DIR/wf_recon_upstream_of_whitened_bandpass_wavefile.gv > $RESULTS_DIR/wf_recon_upstream_of_whitened_bandpass_wavefile.svg


##############
#   Q6_pro   #
##############


# draw recon workflow graph with all observables

$QUERIES_DIR/render_recon_complete_wf_graph_q6.sh > $RESULTS_DIR/wf_recon_complete_graph_all_observables.gv
dot -Tpdf $RESULTS_DIR/wf_recon_complete_graph_all_observables.gv > $RESULTS_DIR/wf_recon_complete_graph_all_observables.pdf
dot -Tsvg $RESULTS_DIR/wf_recon_complete_graph_all_observables.gv > $RESULTS_DIR/wf_recon_complete_graph_all_observables.svg
