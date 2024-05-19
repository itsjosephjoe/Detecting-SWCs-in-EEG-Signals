% Load EEG signal from Excel file
signal_data = xlsread('eeg2-t4.xlsx', 'A1:A230'); % Load EEG signal from column A rows 1 to 230

% Assuming signal is sampled at 100 Hz
Fs = 100; % Sampling frequency
t = (0:length(signal_data)-1)/Fs; % Time vector

% Double sin template signal (spike-and-wave complex)
template = [zeros(1, Fs*2) sin(2*pi*5*(0:Fs*0.5-1)/Fs) zeros(1, Fs*3) sin(2*pi*5*(0:Fs*0.5-1)/Fs) zeros(1, Fs*2)];

% Generate impulse response of matched filter
impulse_response = fliplr(template);

% Generate impulse response of matched filter (time-reversed conjugate of template)
impulse_response = conj(fliplr(template));

% Cross-correlation between template and EEG signal
ccf = xcorr(template, signal_data); % Cross-correlation with EEG signal

% Apply peak detection algorithm
[pks, locs] = findpeaks(ccf, 'MinPeakHeight', max(ccf)*0.8); % Peaks in CCF

% Plot EEG signal and detected peaks
% Plot EEG signal
figure, subplot(411), plot(t, signal_data, 'b');
hold on;
for i = 1:length(locs)
    [~, index] = min(abs(t - (locs(i) - length(template) + 1) / Fs));
    plot(t(index), signal_data(index), 'ro', 'MarkerSize', 10);
end
title('EEG Signal with Detected Peaks'), xlabel('Time (s)'), ylabel('Amplitude');

% Plot Template Signal
subplot(412), plot((0:length(template)-1)/Fs, template, 'g'), title('Template Signal (Spike-and-Wave Complex)'), xlabel('Time (s)'), ylabel('Amplitude');

% Plot Cross-correlation function
subplot(413), plot(-length(template)+1:length(template)-1, ccf, 'b');
hold on;
stem(locs-length(template)+1, pks, 'ro', 'MarkerFaceColor', 'r');
title('Cross-Correlation Function with Detected Peaks'), xlabel('Lag'), ylabel('Correlation');

% Plot selected peaks
subplot(414), plot(t, signal_data, 'b');
hold on;
for i = 1:length(locs)
    [~, index] = min(abs(t - (locs(i) - length(template) + 1) / Fs));
    plot(t(index), signal_data(index), 'ro', 'MarkerSize', 10);
end
title('EEG Signal with Selected Peaks'), xlabel('Time (s)'), ylabel('Amplitude');






% Apply matched filtering on EEG signal using the impulse response
filtered_signal = filter(impulse_response, 1, signal_data);

% Apply peak detection algorithm on filtered signal
[pks_filtered, locs_filtered] = findpeaks(filtered_signal, 'MinPeakHeight', max(filtered_signal)*0.8);

% Plot EEG signal with detected peaks after matched filtering
% Plot EEG signal
figure, subplot(411), plot(t, signal_data, 'b');
hold on;
for i = 1:length(locs_filtered)
    [~, index] = min(abs(t - (locs_filtered(i) - length(template) + 1) / Fs));
    plot(t(index), signal_data(index), 'ro', 'MarkerSize', 10);
end
title('EEG Signal with Detected Peaks after Matched Filtering'), xlabel('Time (s)'), ylabel('Amplitude');

% Plot template and impulse response together
subplot(412), plot((0:length(template)-1)/Fs, template, 'g', 'DisplayName', 'Template');
hold on;
plot((0:length(impulse_response)-1)/Fs, impulse_response, 'r--', 'DisplayName', 'Impulse Response');
title('Template and Impulse Response of Matched Filter'), xlabel('Time (s)'), ylabel('Amplitude'), legend;

% Plot Matched Filter Output
subplot(413), plot(t, filtered_signal, 'g');
hold on;
stem(t(locs_filtered), pks_filtered, 'ro', 'MarkerFaceColor', 'r');
title('Matched Filter Output with Detected Peaks'), xlabel('Time (s)'), ylabel('Amplitude');

% Mark spike-and-wave complexes in EEG signal corresponding to detected peaks
subplot(414), plot(t, signal_data, 'b');
hold on;
for i = 1:length(locs_filtered)
    [~, index] = min(abs(t - (locs_filtered(i) - length(template) + 1) / Fs));
    plot(t(index), signal_data(index), 'ro', 'MarkerSize', 10);
    onset_index = index - round(length(template)/Fs); % Calculate the onset index
    if onset_index >= 1
        plot(t(onset_index), signal_data(onset_index), 'go', 'MarkerSize', 10); % Mark onset of spike-and-wave complex
    end
end
title('EEG Signal with Spike-and-Wave Complexes Marked'), xlabel('Time (s)'), ylabel('Amplitude');
