namespace Registration2.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UpdateCustomerTable : DbMigration
    {
        public override void Up()
        {
            DropPrimaryKey("dbo.Customers");
            AlterColumn("dbo.Customers", "CustomerID", c => c.Int(nullable: false));
            AddPrimaryKey("dbo.Customers", "CustomerID");
        }
        
        public override void Down()
        {
            DropPrimaryKey("dbo.Customers");
            AlterColumn("dbo.Customers", "CustomerID", c => c.Int(nullable: false, identity: true));
            AddPrimaryKey("dbo.Customers", "CustomerID");
        }
    }
}
