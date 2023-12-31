namespace TravelGuideWebsite.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class revisedDb : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.BlogComments",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Content = c.String(),
                        CreationDate = c.DateTime(nullable: false),
                        IsDeleted = c.Boolean(nullable: false),
                        IsStatus = c.Boolean(nullable: false),
                        UserId = c.Int(nullable: false),
                        BlogPostId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.BlogPosts", t => t.BlogPostId, cascadeDelete: true)
                .ForeignKey("dbo.Users", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId)
                .Index(t => t.BlogPostId);
            
            CreateTable(
                "dbo.BlogPosts",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Title = c.String(),
                        Content = c.String(),
                        CreationDate = c.DateTime(nullable: false),
                        Image = c.String(),
                        IsDeleted = c.Boolean(nullable: false),
                        IsStatus = c.Boolean(nullable: false),
                        UserId = c.Int(nullable: false),
                        CityId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Cities", t => t.CityId, cascadeDelete: true)
                .ForeignKey("dbo.Users", t => t.UserId, cascadeDelete: false)
                .Index(t => t.UserId)
                .Index(t => t.CityId);
            
            CreateTable(
                "dbo.Cities",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        Description = c.String(),
                        Image = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.BlogLikes",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreationDate = c.DateTime(nullable: false),
                        UserId = c.Int(nullable: false),
                        BlogPostId = c.Int(nullable: false),
                        IsDeleted = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.BlogPosts", t => t.BlogPostId, cascadeDelete: true)
                .ForeignKey("dbo.Users", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId)
                .Index(t => t.BlogPostId);
            
            CreateTable(
                "dbo.Users",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false),
                        Surname = c.String(nullable: false),
                        Email = c.String(nullable: false),
                        Password = c.String(nullable: false),
                        CreationDate = c.DateTime(nullable: false),
                        Image = c.String(),
                        IsDeleted = c.Boolean(nullable: false),
                        IsStatus = c.Boolean(nullable: false),
                        RoleId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Roles", t => t.RoleId, cascadeDelete: true)
                .Index(t => t.RoleId);
            
            CreateTable(
                "dbo.Roles",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        IsDeleted = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Users", "RoleId", "dbo.Roles");
            DropForeignKey("dbo.BlogLikes", "UserId", "dbo.Users");
            DropForeignKey("dbo.BlogComments", "UserId", "dbo.Users");
            DropForeignKey("dbo.BlogPosts", "UserId", "dbo.Users");
            DropForeignKey("dbo.BlogLikes", "BlogPostId", "dbo.BlogPosts");
            DropForeignKey("dbo.BlogComments", "BlogPostId", "dbo.BlogPosts");
            DropForeignKey("dbo.BlogPosts", "CityId", "dbo.Cities");
            DropIndex("dbo.Users", new[] { "RoleId" });
            DropIndex("dbo.BlogLikes", new[] { "BlogPostId" });
            DropIndex("dbo.BlogLikes", new[] { "UserId" });
            DropIndex("dbo.BlogPosts", new[] { "CityId" });
            DropIndex("dbo.BlogPosts", new[] { "UserId" });
            DropIndex("dbo.BlogComments", new[] { "BlogPostId" });
            DropIndex("dbo.BlogComments", new[] { "UserId" });
            DropTable("dbo.Roles");
            DropTable("dbo.Users");
            DropTable("dbo.BlogLikes");
            DropTable("dbo.Cities");
            DropTable("dbo.BlogPosts");
            DropTable("dbo.BlogComments");
        }
    }
}
