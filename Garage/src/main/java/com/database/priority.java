package com.database;

public class priority {
	int timeEstimated, amount;
//	public static void main(String[] args) {
//		// TODO Auto-generated method stub}

	public priority(int timeEstimated,int amount) {
		this.timeEstimated=timeEstimated;
		this.amount=amount;
	}
	public int calculate_priority() {
		int pr=0;
		if(timeEstimated<=(60*60)) {
			pr+=1;
		}
		if(timeEstimated<=(30*60))
			pr+=1;
		else if(amount>=100)
			pr+=1;
		else if(amount>=500)
			pr+=1;
		else if(amount>=1000)
			pr+=1;
		else if(amount>=5000)
			pr+=1;
		else if(amount>=10000)
			pr+=1;
		return pr;
	}
}
