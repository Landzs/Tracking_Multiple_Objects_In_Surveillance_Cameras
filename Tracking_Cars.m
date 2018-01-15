% function [] = Tracking_Car(file_name)
% This function is the main entrance
% Inputs:
%           file_name:         string
% Outputs:

function Tracking_Car(file_name)
    global obj;
    global tracks;
    obj = setupSystemObjects(file_name);
    tracks = initializeTracks(); % Create an empty array of tracks.
    nextId = 1; % ID of the next track
    showId = 1;
    while ~isDone(obj.reader)
        frame = obj.reader.step();
        [centroids, bboxes, mask] = detectObjects(frame);
%         if(centroids)
%             centroids 
%        
%             round(centroids)
%             mask(round(centroids(2)),round(centroids(1))) 
%         pause; 
%         end
%             figure,imshow(mask,[]);title('Raw');hold on;
%             plot(round(centroids(1)),round(centroids(2)),'ro'); 
%             	
%                 hold on;
%             for i= 1:size(mask,1)
%                  for j=1 :size(mask,2)
%                     if(mask(i,j)==1)
% %                plot(j,i,'ro'); hold on;
%                 
%                     end
%                  end
%             end
%             pause; 
% %             figure,imshow(mask,[]);title('Raw');
%         end
% %         figure,imshow(mask,[]);title('Raw');
% %         hold on;
% %         plot(size(mask,1)-420,size(mask,2)-130,'ro'); 
        

        predictNewLocationsOfTracks(mask,centroids);
        [assignments, unassignedTracks, unassignedDetections] = ...
        detectionToTrackAssignment(centroids);

        updateAssignedTracks(assignments,centroids, bboxes);
        updateUnassignedTracks(unassignedTracks);
        deleteLostTracks();
        [nextId]=createNewTracks(centroids, unassignedDetections, bboxes,nextId);
        showId= displayTrackingResults(frame,mask,showId);
%                     figure,imshow(mask,[]);title('Raw');pause;
    %     obj.maskPlayer.step(mask);
    end
%             close all;
end