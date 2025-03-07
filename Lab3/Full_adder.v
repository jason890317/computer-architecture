module Full_adder(sum,cout,cin,inp1,inp2);

input cin, inp1, inp2;
output sum,cout;

////////////////////////////////////  count   'cout'  /////////////////////////////////////////////////////// 
and and1(inp1_2,inp1,inp2); //inp1_2 = inp1 and inp2
and and2(cin_inp1,cin,inp1); // cin_inp1 = cin and inp1
and and3(cin_inp2,cin,inp2); // cin_inp2 = cin and inp2
or or1(or_wire,inp1_2,cin_inp1); // or_wire = inp1_2 or cin_inp1
or or2(cout,or_wire,cin_inp2); // cout = or_wire or cin_inp2
////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////   count 'sum'  /////////////////////////////////////////////////////// 
xor xor1(xor_wire,cin,inp1); // xor_wire = cin xor inp1
xor xor2(sum,xor_wire,inp2); // sum = xor_wire xor inp2
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

endmodule