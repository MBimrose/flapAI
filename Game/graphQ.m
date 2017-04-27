function graphQ(handles,MatrixName)

a = csvread(MatrixName);

[row,col,~]=size(a);

%% Loop through matrix

pointspos=1;
pointsneg=1;
rowPos=[];
colPos=[];
rowNeg=[];
colNeg=[];
for i=1:row
    for j=1:col/2
        if a(i,j) > 0
            rowPos(pointspos)=i;
            colPos(pointspos)=j;
            pointspos=pointspos+1;
        elseif a(i,j) < 0
            rowNeg(pointsneg)=i;
            colNeg(pointsneg)=j;
            pointsneg=pointsneg+1;
        end
    end
end

%% Flip row vectors

rowPos=rowPos.*-1;
rowNeg=rowNeg.*-1;

%% Same thing but for jump states

pointspos2=1;
pointsneg2=1;
rowPos2=[];
colPos2=[];
rowNeg2=[];
colNeg2=[];
for i=1:row
    for j=col/2+1:col
        if a(i,j) > 0
            rowPos2(pointspos2)=i;
            colPos2(pointspos2)=j-400;
            pointspos2=pointspos2+1;
        elseif a(i,j) < 0
            rowNeg2(pointsneg2)=i;
            colNeg2(pointsneg2)=j-400;
            pointsneg2=pointsneg2+1;
        end
    end
end

%% Flip row vectors

rowPos2=rowPos2.*-1;
rowNeg2=rowNeg2.*-1;

%% Graph



plot(handles.plotQ,rowPos,colPos,'b.',rowNeg,colNeg,'r.',rowPos2,colPos2,'g.',rowNeg2,colNeg2,'r.')
axis(handles.plotQ,[-row-1,0,0,col/2])
axis (handles.plotQ,'off')