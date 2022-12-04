using Microsoft.EntityFrameworkCore;

namespace NET6APIInDocker.Models
{
    public class CandidateContext : DbContext
    {
        public CandidateContext(DbContextOptions<CandidateContext> options)
            : base(options) { }
        public DbSet<Candidate> Candidates { get; set; } = null!;
    }
}
