% function [centroids, bboxes, mask] = detectObjects(frame)
% This function is to dectect moving object
% Inputs:
%           frame:              frame 
% Outputs:
%           centroids:          array 
%           bboxes:             array
%           mask:               array
function [centroids, bboxes, mask] = detectObjects(frame)
    global obj;
    global tracks;
    % Detect foreground.
    mask = obj.detector.step(frame);

    % Apply morphological operations to remove noise and fill in holes.
    mask = imopen(mask, strel('rectangle', [3,3]));
    mask = imclose(mask, strel('rectangle', [15, 15]));
    mask = imfill(mask, 'holes');

    % Perform blob analysis to find connected components.
    [~, centroids, bboxes] = obj.blobAnalyser.step(mask);
end