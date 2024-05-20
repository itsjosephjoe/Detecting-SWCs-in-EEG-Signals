# Detecting Spike-and-Wave Complexes (SWCs) in EEG Signals

### ABSTRACT:
Spike-and-wave complexes (SWCs) are special peaks and waves found in an EEG signal which are observed by healthcare professionals in patients who have been diagnosed with or are going to be diagnosed by brain disorders. SWCs are composed of a sharp spike followed by a wave, which has a frequency of around 3 Hz. 

These complexes are detected and observed using template matching. Using cross correlation function (CCF) we can detect a similar complex at the same time in other EEG signals from other electrodes and make an accurate diagnosis of the patient.
Another method to solve this problem is by making a match filter, which aids in detecting SWCs in EEG signals. In this project, we conduct both methods to understand their similarities and differences.

### METHODOLOGY:
We make use of MATLAB to conduct this project due to its easiness to plot the outputs and showing the signals
better. The methodology can be divided into 2 parts – Template Matching and Matched Filtering methods.

#### A. Template Matching -
1. Select the EEG signal (in excel format) which is then plotted normally after sampling at a rate of 100 Hz.
2. Make a template signal which corresponds to the Spike-and-Wave Complex (SWC). For this project, a double sinusoidal signal is selected and displayed.
3. Compute the Cross-Correlation Function (CCF) between the template and the signal. Apply a peak detection algorithm to the result to locate the peaks.
4. Mark the locations of the corresponding SWC complexes in the EEG signal. Also apply the time-delay corrections whenever required.
5. Plot the EEG signal and the CCF, along with the peaks in the CCF and the SWC complexes detected in the EEG signal.
6. Analyze the results.

#### B. Matched Filtering -
1. Using the same template signal, attain an impulse response of the matched filter and plot the template and the impulse response of the matched filter on the same figure and observe.
2. Matched filtering is done with the help of the `filter` command on MATLAB, which is done on the EEG signal.
3. Use the output of the matched filter to find the peaks and plot the SWCs in the original EEG signal corresponding to the peaks found in the output.
4. Check on the delay in the output of the matched filter when observing the SWCs in the signal.
5. Analyze the results.

### REFERENCES:
#### PAPERS:
1. Mayo Clinic, “EEG (electroencephalogram) - Mayo Clinic,” www.mayoclinic.org, May 11, 2022. https://www.mayoclinic.org/tests-procedures/eeg/about/pac-20393875#:~:text=An%20electroencephalogram%20(EEG)%20is%20a
2. P. D. Emmady and A. C. Anilkumar, “EEG Abnormal waveforms,” StatPearls - NCBI Bookshelf, May 01, 2023.
https://www.ncbi.nlm.nih.gov/books/NBK557655/#:~:text=Epileptic%20encephalopathy%20with%20continuous%20spike,genetic%20abnoralities%2C%20and%20metabolic%20derangements
3. “Electroencephalogram (EEG),” Johns Hopkins Medicine, Aug. 08, 2021. https://www.hopkinsmedicine.org/health/treatment-tests-andtherapies/electroencephalogrameeg#:~:text=Generally%2C%20an%20EEG%20procedure%20follows,the%20electrodes%20will%20be%20used
4. N. Website, “Electroencephalogram (EEG),” nhs.uk, Aug. 22, 2023. https://www.nhs.uk/conditions/electroencephalogram/
5. K. Blocka, “EEG (Electroencephalogram) overview,” Healthline, Nov. 09, 2021. https://www.healthline.com/health/eeg
6. Rangaraj M Rangayyan, Biomedical Signal Analysis, Second Edition. IEEE, 2015
#### DATA:
Rangaraj M Rangayyan, Biomedical Signal Analysis, Second Edition. IEEE, 2015
