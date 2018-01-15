function predictNewLocationsOfTracks(mask,centroids)
    global obj;
    global tracks;
        for i = 1:length(tracks)
%             centroids
%             round(centroids)
%             mask(round(centroids(2)),round(centroids(1))) 

            bbox = tracks(i).bbox;
            % Predict the current location of the track.
%             predictedCentroid = predict(tracks(i).kalmanFilter);
%             predictedCentroid = predict(tracks(i).particleFilter);
            tracks(i).particles = pfPredict(tracks(i).particles,mask);
            tracks(i).particles = pfResample(tracks(i).particles,mask,centroids);
            predictedCentroid = mean(tracks(i).particles);
            % Shift the bounding box so that its center is at
            % the predicted location.
            predictedCentroid = int32(predictedCentroid(1:2)) - bbox(3:4) / 2;
            tracks(i).bbox = [predictedCentroid, bbox(3:4)];
        end
    end