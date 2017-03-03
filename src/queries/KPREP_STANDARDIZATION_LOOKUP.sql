-- Check for lookup table
IF OBJECT_ID('dbo.kprepStandardization', 'U') IS NOT NULL
	    
  -- Drop the table
  DROP TABLE dbo.kprepStandardization;

-- End of batch block
GO

-- Creates table to store constants needed to transform kprep to Z-Scores
CREATE TABLE dbo.kprepStandardization (
  schyr INT NOT NULL,
  grade TINYINT NOT NULL,
  subject VARCHAR(3) NOT NULL,
  mu DOUBLE PRECISION NOT NULL,
  sigma DOUBLE PRECISION NOT NULL,
  CONSTRAINT pk_kprep_standardization PRIMARY KEY (schyr, grade, subject)
);

-- End of batch block
GO

-- Inserts values from technical documentation into the table
INSERT dbo.kprepStandardization(schyr, grade, subject, mu, sigma)
VALUES (2012, 3, 'rdg', 208.92, 17.4),
(2012, 4, 'rdg', 208.08, 17.4),
(2012, 5, 'rdg', 207.53, 17.5),
(2012, 6, 'rdg', 207.94, 18.1),
(2012, 7, 'rdg', 208.59, 16.8),
(2012, 8, 'rdg', 208.16, 16.5),
(2012, 3, 'mth', 205.90, 19.0),
(2012, 4, 'mth', 206.48, 16.7),
(2012, 5, 'mth', 206.06, 17.4),
(2012, 6, 'mth', 206.24, 17.8),
(2012, 7, 'mth', 207.78, 18.3),
(2012, 8, 'mth', 206.62, 17.7),
(2012, 4, 'sci', 217.79, 16.6),
(2012, 7, 'sci', 214.91, 16.6),
(2012, 5, 'soc', 214.53, 17.6),
(2012, 8, 'soc', 214.82, 19.8),
(2012, 4, 'mec', 637.77, 41.2),
(2012, 6, 'mec', 652.24, 38.8),
(2012, 5, 'wrt', 8.50, 2.36),
(2012, 6, 'wrt', 7.97, 2.51),
(2012, 8, 'wrt', 9.97, 2.72),
(2012, 10, 'wrt', 9.76, 2.74),
(2012, 11, 'wrt', 9.10, 2.90),
(2013, 3, 'rdg', 208.67, 17.1),
(2013, 4, 'rdg', 208.31, 18.5),
(2013, 5, 'rdg', 208.51, 15.6),
(2013, 6, 'rdg', 209.17, 16.7),
(2013, 7, 'rdg', 210.86, 16.0),
(2013, 8, 'rdg', 209.73, 15.7),
(2013, 3, 'mth', 207.80, 19.9),
(2013, 4, 'mth', 207.66, 18.1),
(2013, 5, 'mth', 209.39, 18.6),
(2013, 6, 'mth', 206.61, 16.5),
(2013, 7, 'mth', 206.58, 16.6),
(2013, 8, 'mth', 208.00, 16.9),
(2013, 4, 'sci', 217.68, 17.0),
(2013, 7, 'sci', 215.73, 16.8),
(2013, 5, 'soc', 214.28, 17.2),
(2013, 8, 'soc', 214.02, 17.9),
(2013, 4, 'mec', 640.22, 41.2),
(2013, 6, 'mec', 655.19, 40.4),
(2013, 5, 'wrt', 8.67, 2.51),
(2013, 6, 'wrt', 8.50, 2.64),
(2013, 8, 'wrt', 9.62, 2.70),
(2013, 10, 'wrt', 9.44, 2.54),
(2013, 11, 'wrt', 10.05, 2.85),
(2014, 3, 'rdg', 211.25, 19.6),
(2014, 4, 'rdg', 210.66, 16.8),
(2014, 5, 'rdg', 211.87, 15.3),
(2014, 6, 'rdg', 210.43, 16.3),
(2014, 7, 'rdg', 211.10, 15.5),
(2014, 8, 'rdg', 209.91, 14.0),
(2014, 3, 'mth', 209.34, 20.2),
(2014, 4, 'mth', 210.51, 18.2),
(2014, 5, 'mth', 210.95, 17.8),
(2014, 6, 'mth', 209.48, 18.8),
(2014, 7, 'mth', 207.63, 18.3),
(2014, 8, 'mth', 209.28, 17.7),
(2014, 4, 'sci', 218.56, 17.4),
(2014, 7, 'sci', 216.08, 17.4),
(2014, 5, 'soc', 213.83, 17.6),
(2014, 8, 'soc', 214.49, 18.6),
(2014, 4, 'mec', 639.95, 41.2),
(2014, 6, 'mec', 653.79, 39.4),
(2014, 5, 'wrt', 8.85, 2.58),
(2014, 6, 'wrt', 8.80, 2.71),
(2014, 8, 'wrt', 9.32, 2.78),
(2014, 10, 'wrt', 9.17, 2.56),
(2014, 11, 'wrt', 9.85, 2.83),
(2015, 3, 'rdg', 210.78, 17.6),
(2015, 4, 'rdg', 210.30, 15.9),
(2015, 5, 'rdg', 211.15, 15.3),
(2015, 6, 'rdg', 211.02, 14.9),
(2015, 7, 'rdg', 211.48, 15.2),
(2015, 8, 'rdg', 210.74, 15.7),
(2015, 3, 'mth', 209.65, 20.5),
(2015, 4, 'mth', 209.92, 18.8),
(2015, 5, 'mth', 212.40, 20.2),
(2015, 6, 'mth', 208.27, 17.5),
(2015, 7, 'mth', 207.51, 17.3),
(2015, 8, 'mth', 208.78, 17.5),
(2015, 5, 'soc', 215.04, 17.6),
(2015, 8, 'soc', 213.75, 18.4),
(2015, 4, 'mec', 642.43, 42.0),
(2015, 6, 'mec', 657.82, 41.9),
(2015, 5, 'wrt', 224.00, 31.9),
(2015, 6, 'wrt', 224.83, 31.1),
(2015, 8, 'wrt', 218.61, 30.8),
(2015, 10, 'wrt', 220.75, 33.4),
(2015, 11, 'wrt', 237.10, 32.4),
(2016, 3, 'rdg', 210.76, 19.6),
(2016, 4, 'rdg', 211.63, 17.5),
(2016, 5, 'rdg', 212.76, 15.8),
(2016, 6, 'rdg', 211.64, 17.1),
(2016, 7, 'rdg', 211.93, 16.2),
(2016, 8, 'rdg', 210.72, 14.5),
(2016, 3, 'mth', 210.27, 20.7),
(2016, 4, 'mth', 211.56, 18.6),
(2016, 5, 'mth', 212.34, 18.1),
(2016, 6, 'mth', 210.76, 19.5),
(2016, 7, 'mth', 209.06, 18.9),
(2016, 8, 'mth', 209.31, 18.1),
(2016, 5, 'soc', 213.30, 17.2),
(2016, 8, 'soc', 214.48, 18.7),
(2016, 4, 'mec', 639.99, 41.5),
(2016, 6, 'mec', 654.80, 39.8),
(2016, 5, 'wrt', 224.57, 34.8),
(2016, 6, 'wrt', 225.18, 32.6),
(2016, 8, 'wrt', 222.86, 33.0),
(2016, 10, 'wrt', 223.10, 35.8),
(2016, 11, 'wrt', 236.85, 34.1);

-- End of batch block
GO
