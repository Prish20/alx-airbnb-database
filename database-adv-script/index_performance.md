# Index Performance Analysis

## Before Indexing

- Execution Time: 0.077 ms
- Planning Time: 1.544 ms
- Query Plan:
  - Sequential Scan on both users and bookings.
  - Hash Left Join.
- Cost: 12.4
- Observation: Query is relatively slower without indexing.

## After Indexing

- Execution Time: 0.056 ms
- Planning Time: 3.041 ms
- Query Plan:
  - Hash Right Join.
  - Sequential Scan still present despite indexing.
- Cost: 2.41
- Observation: Significant reduction in execution time due to indexing. Planning time increased due to index evaluation.

## Conclusion

- Indexes help improve query execution speed, but planning time may increase.
- Sequential Scan may still be preferred by the optimizer if the data volume is small.
- Forcing index usage with `SET enable_seqscan = off;` yield better results in testing.
