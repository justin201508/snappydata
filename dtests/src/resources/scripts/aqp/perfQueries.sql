Select sum(ArrDelay) as x , absolute_error(x),relative_error(x) from airline with error;
Select avg(ArrDelay) as x , absolute_error(x),relative_error(x) from airline  with error;
Select count(ArrDelay) as x , absolute_error(x),relative_error(x) from airline  with error;
Select uniqueCarrier, sum(ArrDelay) as x , absolute_error(x),relative_error(x)  from airline  group by uniqueCarrier having relative_error(x) < 0.9 order by uniqueCarrier desc  with error ;
Select  uniqueCarrier, avg(ArrDelay) as x , absolute_error(x),relative_error(x)  from airline group by uniqueCarrier having relative_error(x) < 0.9 with error;
Select  uniqueCarrier, count(ArrDelay) as x , absolute_error(x),relative_error(x)  from airline group by uniqueCarrier with error;
Select uniqueCarrier, sum(ArrDelay) as x , absolute_error(x),relative_error(x)  from airline   group by uniqueCarrier having relative_error(x) < 0.9 order by uniqueCarrier desc  with error ;
Select uniqueCarrier, avg(ArrDelay) as x , absolute_error(x),relative_error(x)  from airline group by uniqueCarrier having relative_error(x) < 0.9 order by uniqueCarrier desc  with error ;
Select uniqueCarrier, count(ArrDelay) as x , absolute_error(x),relative_error(x)  from airline  group by uniqueCarrier order by uniqueCarrier desc with error;
Select uniqueCarrier, sum(ArrDelay) as x , absolute_error(x),relative_error(x)  from airline  group by uniqueCarrier having relative_error(x) < 90 order by x with error;
Select uniqueCarrier, avg(ArrDelay) as x , absolute_error(x),relative_error(x)  from airline  group by uniqueCarrier having relative_error(x) < 0.9 order by x with error ;
Select uniqueCarrier, count(ArrDelay) as x , absolute_error(x),relative_error(x)  from airline  group by uniqueCarrier order by count(ArrDelay) with error ;
Select sum(CRSDepTime) as x,sum(DepTime) as y ,relative_error(x),relative_error(y) from airline with error;
Select avg(CRSDepTime) as x,avg(DepTime) as y ,relative_error(x),relative_error(y) from airline with error ;
Select count(CRSDepTime) as x,count(DepTime) as y ,relative_error(x),relative_error(y) from airline with error ;
