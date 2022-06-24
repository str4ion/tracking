package com.tracking.DAO;

import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import org.bson.Document;

public class PositionDao {
    private DBCollection col;
    private MongoCollection<Document> positions_collection;

    public PositionDao(MongoClient mongo) {
        this.col = mongo.getDB("tracking").getCollection("Postitions");
        this.positions_collection=mongo.getDatabase("tracking").getCollection("Postitions");
    }

    public MongoCollection<Document> getPositions_collection() {
        return positions_collection;
    }

    public void setPositions_collection(MongoCollection<Document> positions_collection) {
        this.positions_collection = positions_collection;
    }

    public DBCollection getCol() {
        return col;
    }

    public void setCol(DBCollection col) {
        this.col = col;
    }
}
