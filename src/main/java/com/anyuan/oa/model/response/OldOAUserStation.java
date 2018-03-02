package com.anyuan.oa.model.response;

/**
 * Created by pengkan on 2018/3/2.
 */
public class OldOAUserStation {
    private String stationID;
    private String stationName;
    private boolean isPrime;

    public String getStationID() {
        return stationID;
    }

    public void setStationID(String stationID) {
        this.stationID = stationID;
    }

    public String getStationName() {
        return stationName;
    }

    public void setStationName(String stationName) {
        this.stationName = stationName;
    }

    public boolean isPrime() {
        return isPrime;
    }

    public void setPrime(boolean prime) {
        isPrime = prime;
    }
}
