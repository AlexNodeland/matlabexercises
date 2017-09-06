clear; clc;
FILENAME='topo.dat';
NUMCOLS=3;
delimiterIn=' ';
headerlinesIn=1;
datacell=importdata(FILENAME,delimiterIn,headerlinesIn);
coords=zeros(size(datacell)(1)-1,NUMCOLS);
for i = (1+headerlinesIn):size(datacell)(1)
  for j = 1:NUMCOLS
    coords(i-1,j)=str2double(strsplit(datacell{i})(j){1});
  end
end
coordmax=max(coords(:,1));
coordmin=min(coords(:,1));
numelem=sqrt(length(coords(:,1)));
increment=(coordmax-coordmin)/(numelem-1);
x=coordmin:increment:coordmax;
y=coordmin:increment:coordmax;
z=reshape(coords(:,3),[numelem,numelem]);
surf(x,y,z)