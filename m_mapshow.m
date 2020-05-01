function m_mapshow(shapefile)
% M_MAPSHOW display shapefile using the current projection
%            m_mapshow(shapefile)
% 

% Yang Li (libravo@foxmail.com) 1/May 2020 
%
% This software is provided "as is" without warranty of any kind. But
% it's mine, so you can't sell it.

% 1/May 2020 first version 

global MAP_PROJECTION MAP_COORDS

if isempty(MAP_PROJECTION)
  disp('No Map Projection initialized - call M_PROJ first!');
  return;
end

if nargin==0
  disp(' Usage');
  disp(' m_mapshow(shapefile)');
else
  shape = shaperead(shapefile);
  lon = [shape.X]; lat = [shape.Y];
  
  if strcmp(MAP_COORDS.name.name,MAP_PROJECTION.coordsystem.name.name) && ...  % using same coord system as projection
          MAP_COORDS.name.mdate==MAP_PROJECTION.coordsystem.name.mdate
     % Sneaky way of making default clipping on (sneaky 'cause only the 4th
     % input parameter is checked for the clipping property)
     [lon, lat] = m_ll2xy(lon, lat);
     mapshow(lon, lat, 'color', 'k');     
  end

end