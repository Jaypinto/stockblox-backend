package persistence;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.Table;

@Table(appliesTo = "stock")
public class Stock {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "id", updatable = false, nullable = false)
	private final int id;
	
	@Column(name = "stock_ticker", nullable = false)
	private String stockName;
	
	@Column(name = "stock_name", nullable = false)
	private String stockTicker;
	
	@Column(name = "prev_close")
	private double prevClose;
	
	public Stock(int id, String stockName, String stockTicker, double prevClose) {
		this.id = id;
		this.stockName = stockName;
		this.stockTicker = stockTicker;
		this.setPrevClose(prevClose);
	}
	
	public int getId() {
		return id;
	}

	public String getStockTicker() {
		return stockTicker;
	}

	public String getStockName() {
		return stockName;
	}
	

	public double getPrevClose() {
		return prevClose;
	}

	public void setPrevClose(double prevClose) {
		this.prevClose = prevClose;
	}
	

}
