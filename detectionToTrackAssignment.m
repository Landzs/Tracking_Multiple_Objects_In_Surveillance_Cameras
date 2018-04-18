% function [assignments, unassignedTracks, unassignedDetections] = ...
%            detectionToTrackAssignment(centroids)
% compute an assignment which minimizes the total cost
% Inputs:   
%           centroids:                 array
% Outputs:
%           assignments:               array
%           unassignedTracks:          array
%           unassignedDetections:      array
function [assignments, unassignedTracks, unassignedDetections] = ...
            detectionToTrackAssignment(centroids)
    global obj;
    global tracks;
	nTracks = length(tracks);
	nDetections = size(centroids, 1);
	% Compute the cost of assigning each detection to each track.
	cost = zeros(nTracks, nDetections);
	for i = 1:nTracks
        cost(i, :) = distance(mean(tracks(i).particles), centroids);
    end

	% Solve the assignment problem.
	costOfNonAssignment = 20;
	[assignments, unassignedTracks, unassignedDetections] = ...
        assignDetectionsToTracks(cost, costOfNonAssignment);
end