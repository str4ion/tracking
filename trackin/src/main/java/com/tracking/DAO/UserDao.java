package com.tracking.DAO;

import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.WriteResult;
import com.tracking.Model.User;

public class UserDao {
    private DBCollection col;

    public UserDao(MongoClient mongo) {
        this.col = mongo.getDB("tracking").getCollection("Users");
    }

    public Boolean saveUser(String login, String email, String password) {
        User user = new User(login ,email ,password );
        BasicDBObjectBuilder docBuilder = BasicDBObjectBuilder.start();
        docBuilder.append("_id", user.getId());
        docBuilder.append("login", user.getLogin());
        docBuilder.append("password", user.getPassword());
        docBuilder.append("email", user.getEmail());
        DBObject userdoc = docBuilder.get();
        WriteResult result = this.col.insert(userdoc);
        return true ;

    }

    public DBObject readUser(String login, String password) {
        DBObject user = null;
        DBObject query = BasicDBObjectBuilder.start().add("login", login).add("password", password).get();
        DBCursor cursor = this.col.find(query);
        if(cursor.hasNext()){
            user = cursor.next();
        }
        return user;

    }
}
