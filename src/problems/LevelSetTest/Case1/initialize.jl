include("../AbstractProblems.jl")

include("../../kernel/globalStructs.jl")
include("../../kernel/mesh/mesh.jl")
include("../../io/plotting/jeplots.jl")

function initialize(SD::NSD_1D, ET::LevelSetTest, mesh::St_mesh, inputs::Dict, OUTPUT_DIR::String, TFloat)

    println(" # Initialize fields for LevelSetTest ........................")
    
    qinit = Array{TFloat}(undef, mesh.npoin, 1)
    q     = define_q(SD, mesh.nelem, mesh.npoin, mesh.ngl, TFloat; neqs=1)

    for iel_g = 1:mesh.nelem
        for i=1:mesh.ngl
            
            ip = mesh.connijk[i,iel_g]
            x  = mesh.x[ip]
            
            #q.qn[ip, 1] = exp(-σ*x*x)
            q.qn[ip, 1] = exp(-200.0*(x - 0.25)^2)
            
        end
    end
    
    #------------------------------------------
    # Plot initial condition:
    # Notice that I scatter the points to
    # avoid sorting the x and q which would be
    # becessary for a smooth curve plot.
    #------------------------------------------
    title = string( "Tracer: initial condition")
    #plot_curve(mesh.x, q.qn[:,1], title, string(OUTPUT_DIR, "/INIT.png"))
    
    println(" # Initialize fields for LevelSetTest ........................ DONE")
    
    return q


#= 
    q     = St_SolutionVars{TFloat}(zeros(mesh.npoin),
                                    zeros(mesh.npoin),
                                    zeros(mesh.npoin),
                                    zeros(mesh.npoin),
                                    zeros(mesh.npoin),
                                    zeros(mesh.npoin),
                                    zeros(1, 1))
    
    ngl = mesh.nop + 1
    for iel_g = 1:mesh.nelem
        for l=1:ngl
            ip       = mesh.conn[l, iel_g]
            
            x        = mesh.x[ip]
            q.qn[ip] = exp(-64.0*x*x)
        end
    end
    #------------------------------------------
    # Plot initial condition:
    # Notice that I scatter the points to
    # avoid sorting the x and q which would be
    # becessary for a smooth curve plot.
    #------------------------------------------
    #plt = scatter() #Clear plot
    #display(scatter!(mesh.x, q.qn))
    
    return q =#
end
