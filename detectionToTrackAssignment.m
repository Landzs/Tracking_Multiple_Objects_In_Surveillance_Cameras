function [assignments, unassignedTracks, unassignedDetections] = ...
            detectionToTrackAssignment(centroids)
    global obj;
    global tracks;
        nTracks = length(tracks);
        nDetections = size(centroids, 1);
        % Compute the cost of assigning each detection to each track.
        cost = zeros(nTracks, nDetections);
        for i = 1:nTracks
            cost(i, :) = distance(predict(tracks(i).particleFilter), centroids);
        end

        % Solve the assignment problem.
        costOfNonAssignment = 200;
        [assignments, unassignedTracks, unassignedDetections] = ...
            assignDetectionsToTracks(cost, costOfNonAssignment);
    end