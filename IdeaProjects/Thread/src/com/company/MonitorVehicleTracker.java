package com.company;

import java.util.Map;

public class MonitorVehicleTracker {

    private final Map<String,MutablePoint> locations;

    public MonitorVehicleTracker(Map<String, MutablePoint> locations) {
        this.locations = locations;
    }

    public synchronized Map<String, MutablePoint> getLocations() {
        return locations;
    }
    public synchronized  MutablePoint getLocation(String id){
        MutablePoint loc=locations.get(id);
        return loc==null? null:new MutablePoint(loc);
    }
    public void setLocation(String id,int x,int y){

    }

}
