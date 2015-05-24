using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FINKIStore
{
    public class User
    {
        public int user_id {set; get;}
        public String username {set; get; }
        public String password { set; get; }
        public String name { set; get; }
        public String address {set; get; }
        public String phone { set; get; }
        public String email { set; get; }
        public int type {set; get; }
        

        public User()
        {}

        public string getName()
        {
            return this.name;
        }
       
        public int getUserType()
        {
            return this.type;
        }
        public int getUserId()
        {
            return user_id;
        }
    }
}