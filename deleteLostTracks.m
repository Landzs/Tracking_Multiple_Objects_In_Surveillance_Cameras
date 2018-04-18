% function deleteLostTracks()
% deletes tracks that have been invisible for too many consecutive frames
% Inputs:   
%            
% Outputs:
%            
function deleteLostTracks()
    global obj;
    global tracks;
    if isempty(tracks)
    	return;
    end

    invisibleForTooLong = 30;
    ageThreshold = 8;

    % Compute the fraction of the track's age for which it was visible.
    ages = [tracks(:).age];
    totalVisibleCounts = [tracks(:).totalVisibleCount];
    visibility = totalVisibleCounts ./ ages;

    % Find the indices of 'lost' tracks.
    lostInds = (ages < ageThreshold & visibility < 0.4) | ...
    [tracks(:).consecutiveInvisibleCount] >= invisibleForTooLong;

    % Delete lost tracks.
    tracks = tracks(~lostInds);
end