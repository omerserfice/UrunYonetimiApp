using Microsoft.EntityFrameworkCore.Migrations;

namespace UrunYonetimDAL.Migrations
{
    public partial class init5 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Status",
                table: "CustomerProducts");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "Status",
                table: "CustomerProducts",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }
    }
}
