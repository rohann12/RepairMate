package com.database;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.concurrent.TimeUnit;

public class priority {
	int timeEstimated, amount, numberOfJobs; // Declare numberOfJobs as an instance variable
	String startTime, estimatedCompleted, estimatedCost, concatenatedJobs; 

	public priority(String startTime, String estimatedCompleted, String estimatedCost, String concatenatedJobs) {
		this.startTime = startTime;
		this.estimatedCompleted = estimatedCompleted;
		this.estimatedCost = estimatedCost;
		this.concatenatedJobs = concatenatedJobs;

		// Calculate timeEstimated in minutes as an integer
		try {
			long currentTimeMillis = new Date().getTime();
			long estimatedCompletedMillis = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(estimatedCompleted)
					.getTime();
			this.timeEstimated = (int) ((estimatedCompletedMillis - currentTimeMillis) / (60 * 1000)); // Initialize
																										// instance
																										// variable
			this.amount = Integer.parseInt(estimatedCost); // Initialize instance variable

			// Calculate the number of concatenated jobs
			this.numberOfJobs = calculateNumberOfJobs(concatenatedJobs);
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println(timeEstimated + " mins");
		System.out.println("RS " + amount);
		System.out.println(numberOfJobs + " jobs");
	}

	public int calculate_priority() {
		int pr = 0;

		// Conditions based on timeEstimated 1hr
		if (timeEstimated <= (60 * 60)) {
			pr += 1;
		}
		// 30 min
		if (timeEstimated <= (30 * 60)) {
			pr += 1;
		} else if (timeEstimated < (24 * 60 * 60)) { // Less than a day
			pr += 3;

			// Urgency factor: Closer to 0 timeEstimated, higher priority
			double urgencyFactor = 1.0 - ((double) timeEstimated / (24 * 60 * 60));
			pr += (int) (urgencyFactor * 5); // Adjust the multiplier (5) as needed
		} else if (timeEstimated < (2 * 24 * 60 * 60)) { // Less than 2 days
			pr += 2;
		} else if (timeEstimated < (3 * 24 * 60 * 60)) { // Less than 3 days
			pr += 1;
		}

		// Conditions based on amount
		if (amount >= 100) {
			pr += 1;
		} else if (amount >= 500) {
			pr += 1;
		} else if (amount >= 1000) {
			pr += 1;
		} else if (amount >= 5000) {
			pr += 1;
		} else if (amount >= 10000) {
			pr += 1;
		}

		// Condition based on numberOfJobs
		if (numberOfJobs > 0 && numberOfJobs <= 5) {
			pr += numberOfJobs; // More jobs, more priority (up to 5)
		}
		// Calculate the estimated job duration in days
		long estimatedDurationMillis = calculateEstimatedDuration();
		long estimatedDurationDays = TimeUnit.MILLISECONDS.toDays(estimatedDurationMillis);

		// Priority adjustment based on estimated duration
		if (estimatedDurationDays <= 1) {
			pr += 7; // Highest priority for jobs estimated to complete within 1 day
		} else if (estimatedDurationDays <= 2) {
			pr += 6;
		} else if (estimatedDurationDays <= 3) {
			pr += 5;
		} else if (estimatedDurationDays <= 4) {
			pr += 4;
		} else if (estimatedDurationDays <= 5) {
			pr += 3;
		} else if (estimatedDurationDays <= 6) {
			pr += 2;
		} else if (estimatedDurationDays <= 7) {
			pr += 1; // Priority for jobs estimated to complete within 7 days
		}

		return pr;
	}

	private int calculateNumberOfJobs(String concatenatedJobs) {
		if (concatenatedJobs.isEmpty()) {
			return 0;
		}
		return concatenatedJobs.split("\\. ").length;
	}

	private long calculateEstimatedDuration() {
		try {
			long startTimeMillis = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(startTime).getTime();
			long estimatedCompletedMillis = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(estimatedCompleted)
					.getTime();
			return estimatedCompletedMillis - startTimeMillis;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
