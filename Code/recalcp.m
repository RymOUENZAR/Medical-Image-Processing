function recalcp
global I2 Ir I1 F im1 im2 a1 i1 i2 input_points base_points

if (get(im1,'value'))==(get(im1,'max'))
    close
    clear input_points base_points
    i1=Ir;
    i2=I1;
    cpselect(i1,i2);
else
    close
    clear input_points base_points
    i1=I1;
    i2=Ir;
    cpselect(i1,i2);
end
