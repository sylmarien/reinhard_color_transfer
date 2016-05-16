% Demostration of Reinhard's Image Colour Transfer

%   References:
% Erik Reinhard, Michael Ashikhmin, Bruce Gooch and Peter Shirley,
% 'Color Transfer between Images', IEEE CG&A special issue on Applied
% Perception, Vol 21, No 5, pp 34-41, September - October 2001

% Copyright 2015 Han Gong, University of East Anglia
for i=1:11
    for j = 1:11
        if i ~= j
            if i < 10
                I0 = im2double(imread(['inputs/image00' int2str(i) 'CROPPED.jpg']));
            else
                I0 = im2double(imread(['inputs/image0' int2str(i) 'CROPPED.jpg']));
            end
            if j < 10
                I1 = im2double(imread(['inputs/image00' int2str(j) 'CROPPED.jpg']));
            else
                I1 = im2double(imread(['inputs/image0' int2str(j) 'CROPPED.jpg']));
            end

            IR = cf_reinhard(I0,I1);

            % figure;
            % subplot(1,3,1); imshow(I0); title('Original Image'); axis off
            % subplot(1,3,2); imshow(I1); title('Target Palette'); axis off
            % subplot(1,3,3); imshow(IR); title('Result After Colour Transfer'); axis off
            
            if i < 10 && j < 10
                imwrite(IR, ['colored/image00' int2str(i) 'ColoredBy00' int2str(j) '.jpg']);
                imwrite(IR, ['colored/byColorer/ColoredBy00' int2str(j) 'image00' int2str(i) '.jpg']);
            elseif i < 10 && j >= 10
                imwrite(IR, ['colored/image00' int2str(i) 'ColoredBy0' int2str(j) '.jpg']);
                imwrite(IR, ['colored/byColorer/ColoredBy0' int2str(j) 'image00' int2str(i) '.jpg']);
            elseif i >= 10 && j < 10
                imwrite(IR, ['colored/image0' int2str(i) 'ColoredBy00' int2str(j) '.jpg']);
                imwrite(IR, ['colored/byColorer/ColoredBy00' int2str(j) 'image0' int2str(i) '.jpg']);
            else
                imwrite(IR, ['colored/image0' int2str(i) 'ColoredBy0' int2str(j) '.jpg']);
                imwrite(IR, ['colored/byColorer/ColoredBy0' int2str(j) 'image0' int2str(i) '.jpg']);
            end
        else
            if i < 10
                I0 = im2double(imread(['inputs/image00' int2str(i) 'CROPPED.jpg']));
                imwrite(I0, ['colored/image00' int2str(i) 'ORIGINAL.jpg']);
            else
                I0 = im2double(imread(['inputs/image0' int2str(i) 'CROPPED.jpg']));
                imwrite(I0, ['colored/image0' int2str(i) 'ORIGINAL.jpg']);
            end
        end
    end
end