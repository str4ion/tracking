package com.tracking.DAO;

import com.mongodb.*;
import com.mongodb.client.MongoCollection;
import org.bson.Document;

import java.util.List;

public class ActivityDao {

    private DBCollection col;
    private MongoCollection<Document> activities_collection ;
    public ActivityDao(MongoClient mongo) {
        this.col = mongo.getDB("tracking").getCollection("Activities");
        this.activities_collection=mongo.getDatabase("tracking").getCollection("Activities");
    }

    public List<DBObject> readAllActivities(String id) {
        List<DBObject> activities = null;
        DBObject query = BasicDBObjectBuilder.start().add("iduser", id).get();
        DBCursor cursor = this.col.find(query);
        activities = cursor.toArray();
        return activities;
    }



    public MongoCollection<Document> getActivities_collection() {return activities_collection;}
    public DBCollection getCol() {return col;}
}
