using SQLite;
using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

namespace Shaidow.Data
{
    public class ChatDB
    {
        [PrimaryKey, AutoIncrement]
        public int Id{get;set;}
        public string Sender{get;set;} = String.Empty;
        public string MessageText{get;set;} = String.Empty;
        public DateTime Timestamp{get;set;}
    }

    
}
