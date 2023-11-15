ALTER PROC THONGKE
	@DieuKien VARCHAR(50) 
AS
BEGIN
	DECLARE @i INT = 0
	-- Lọc theo ngày hiện tại
	IF(@DieuKien LIKE 'DAY' OR @DieuKien LIKE '-1DAY')
		BEGIN
			-- Tạo bảng tạm thời chứa 24 mốc giờ từ 00:00 đến 23:00
			DECLARE @HourTable TABLE ( [Hour] INT )

			--lấy ra 24 mốc giờ
			WHILE @i < 24
			BEGIN
				INSERT INTO @HourTable ([Hour])
				VALUES (@i)
				SET @i = @i + 1
			END

			-- Đặt thời gian bắt đầu là 00:00:00 và thời gian kết thúc là 23:59:59 của ngày hiện tại
			DECLARE @StartTime DATETIME = CAST(CONVERT(VARCHAR, GETDATE() - IIF(@DieuKien LIKE '-1DAY', -1, 0), 101) AS DATETIME)
			DECLARE @EndTime DATETIME = DATEADD(SECOND, -1, DATEADD(DAY, 1, @StartTime))

			-- Truy vấn để lấy tổng doanh thu từ 24 mốc thời gian trong ngày hiện tại
			SELECT
				RIGHT('0' + CAST(ht.[Hour] AS NVARCHAR(2)), 2) + ':00' AS [Labels],
				ISNULL(SUM([Amount]), 0) AS [TotalRevenue],
				ISNULL(SUM( [CountOrder]),0) AS CountOrder,
				ISNULL(SUM( [CountProduct]),0) AS CountProduct
			FROM @HourTable ht
			LEFT JOIN (
				SELECT DATEPART(HOUR, [CreateDate]) AS [Hour], SUM([Price]* [Quantity]) AS [Amount], d.OrderId AS [IDorder], SUM(d.Quantity) AS [CountProduct]
				FROM Orders o
				JOIN OrderDetails d ON o.Id = d.OrderId
				WHERE [CreateDate] >= @StartTime AND [CreateDate] <= @EndTime
				GROUP BY DATEPART(HOUR, [CreateDate]), d.OrderId
			) subquery ON ht.[Hour] = subquery.[Hour]
			LEFT JOIN (
			SELECT  Orders.id,COUNT(*) AS [CountOrder] FROM Orders
			GROUP BY  Orders.id
		) subquerya ON subquery.[IDorder] = subquerya.Id
			GROUP BY ht.[Hour]
			ORDER BY [Labels]
		END

	IF(@DieuKien LIKE '-7DAY' OR @DieuKien LIKE '-30DAY')
	BEGIN
		-- Lấy ra 7 trước đó kể từ ngày hiện tại
		DECLARE @DateTable TABLE (
			[Date] DATE
		)

		WHILE @i < IIF(@DieuKien LIKE '-7DAY', 7,30)
		BEGIN
			INSERT INTO @DateTable ([Date])
			VALUES (DATEADD(DAY, -@i, GETDATE()))
			SET @i = @i + 1
		END

		DECLARE @EndDate DATE = GETDATE() -- Ngày hiện tại
		DECLARE @StartDate DATE = DATEADD(DAY, IIF(@DieuKien LIKE '7DAY', -7,-30), @EndDate) -- Ngày 7 ngày trước
		-- Truy vấn để lấy tổng doanh thu từ 24 mốc thời gian trong ngày hiện tại
		SELECT
		CONVERT(VARCHAR,ht.[Date],103) AS [Labels],
			ISNULL(SUM([Amount]), 0) AS [TotalRevenue],
			ISNULL(SUM([CountOrder]), 0) AS [CountOrder],
			ISNULL(SUM([CountProduct]),0) AS [CountProduct]
		FROM @DateTable ht
		LEFT JOIN (
			SELECT CAST([CreateDate] AS DATE) AS [Date],  SUM([Price]* [Quantity]) AS [Amount], d.OrderId AS [IDorder] , SUM(d.Quantity) AS [CountProduct]
			FROM Orders o
			JOIN OrderDetails d ON o.Id = d.OrderId
			WHERE CAST([CreateDate] AS DATE) >= @StartDate AND CAST([CreateDate] AS DATE) <= @EndDate
			GROUP BY CAST([CreateDate] AS DATE) ,d.OrderId
		) subquery ON ht.[Date] = subquery.[Date]
		LEFT JOIN (
			SELECT  Orders.id,COUNT(*) AS [CountOrder] FROM Orders
			GROUP BY  Orders.id
		) subquerya ON subquery.[IDorder] = subquerya.Id
		GROUP BY ht.[Date]

	END
END

EXEC THONGKE 'DAY'







