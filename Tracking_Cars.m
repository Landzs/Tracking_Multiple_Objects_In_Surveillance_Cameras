% function [] = Tracking_Car(file_name)
% This function is the main entrance
% Inputs:
%           file_name:         string
% Outputs:

function Tracking_Car(file_name)
    obj = setupSystemObjects(file_name);
    while ~isDone(obj.reader)
        frame = obj.reader.step();
%      figure,imshow( frame ,[]);title('Raw');
    [centroids, bboxes, mask] = detectObjects(obj ,frame);

%     predictNewLocationsOfTracks();
%     [assignments, unassignedTracks, unassignedDetections] = ...
%         detectionToTrackAssignment();
% 
%     updateAssignedTracks();
%     updateUnassignedTracks();
%     deleteLostTracks();
%     createNewTracks();
% 
%     displayTrackingResults();
    obj.maskPlayer.step(mask);
    end
    
end