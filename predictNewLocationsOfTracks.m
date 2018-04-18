% function predictNewLocationsOfTracks(mask,centroids)
% Use the Particle filter to predict the centroid of each 
% track in the current frame, and update its bounding box accordingly.
% Inputs:
%           mask:              array 
%           centroids:         array
% Outputs:
%           
function predictNewLocationsOfTracks(mask,centroids)
    global obj;
    global tracks;
    for i = 1:length(tracks)
    	bbox = tracks(i).bbox;
        % Predict the current location of the track.
        tracks(i).particles = pfDiffusion(tracks(i).particles,mask);
        tracks(i).particles = pfResample(tracks(i).particles,mask,centroids);
        predictedCentroid = mean(tracks(i).particles);
        % Shift the bounding box so that its center is at
        % the predicted location.
        predictedCentroid = int32(predictedCentroid(1:2)) - bbox(3:4) / 2;
        tracks(i).bbox = [predictedCentroid, bbox(3:4)];
    end
end