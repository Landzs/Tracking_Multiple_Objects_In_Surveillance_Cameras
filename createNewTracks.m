% function nextId = createNewTracks(centroids, unassignedDetections, bboxes,nextId)
% Create new tracks from unassigned detections
% Inputs:   
%             centroids                    array
%             unassignedDetections:        array
%             bboxes:                      array
%             nextId:                      integer
% Outputs:
%             nextId:                      array
function nextId = createNewTracks(centroids, unassignedDetections, bboxes,nextId)
	global obj;
    global tracks;
    centroids = centroids(unassignedDetections, :);
	bboxes = bboxes(unassignedDetections, :);

    for i = 1:size(centroids, 1)
        centroid = centroids(i,:);
        bbox = bboxes(i, :);

        % Create a Particle filter object.
        particles=ones(100,2)*0.5*[centroid;centroid];
        % Create a new track.
        newTrack = struct(...
                'id', nextId, ...
                'bbox', bbox, ...
                'particles', particles, ...
                'age', 1, ...
                'totalVisibleCount', 1, ...
                'consecutiveInvisibleCount', 0, ...
                'showId', 0);
        % Add it to the array of tracks.
        tracks(end + 1) = newTrack;

        % Increment the next id.
        nextId = nextId + 1;
	end
end