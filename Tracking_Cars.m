% function [] = Tracking_Car(file_name)
% This function is the main entrance
% Create System objects used for reading video, detecting moving objects and displaying the results.
% Inputs:
%           file_name:         string
% Outputs:

function Tracking_Car(file_name)
    tic
    global obj;
    global tracks;
    obj = setupSystemObjects(file_name);
    tracks = initializeTracks(); % Create an empty array of tracks.
    nextId = 1; % ID of the next track
    showId = 1;
    
    % Detect moving objects, and track them across video frames.
    while ~isDone(obj.reader)
        frame = obj.reader.step();
        [centroids, bboxes, mask] = detectObjects(frame);
        predictNewLocationsOfTracks(mask,centroids);
        [assignments, unassignedTracks, unassignedDetections] = ...
        detectionToTrackAssignment(centroids);
        updateAssignedTracks(assignments,centroids, bboxes);
        updateUnassignedTracks(unassignedTracks);
        deleteLostTracks();
        [nextId]=createNewTracks(centroids, unassignedDetections, bboxes,nextId);
        showId= displayTrackingResults(frame,mask,showId);
    end
    toc
end